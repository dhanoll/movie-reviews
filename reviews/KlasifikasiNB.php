<?php
require 'config.php'; 
require 'PorterStemmer.php';

class KlasifikasiNB {
        private $index = array();
        private $kelas = array('pos', 'neg');
        public $jmlTokenKelas = array('pos' => 0, 'neg' => 0);
        public $jmlToken = 0;
        private $jmlTokenDokumen = array('pos' => 0, 'neg' => 0);
        private $jmlDokumen = 0;
        public $prior = array('pos' => 0, 'neg' => 0);
        private $conn;
        private $stopword;
        public $dataTesting;
        public $term = array();
        public $countwc = array();
        public $pwc = array();
        public $pcw = array();

        public function __construct($positif, $namaPositif, $negatif, $namaNegatif){
                $this->connect();
                $this->getStopword();
                $this->getDataTesting();
                $this->tambahKeIndex($positif, $namaPositif);
                $this->tambahKeIndex($negatif, $namaNegatif);
        }

        private function connect(){
                $this->conn = new mysqli(HOST, USER, PASS, DBNAME);
        }

        private function getStopword(){
                $kueri = "SELECT * FROM stopwords";
                $hasil = $this->conn->query($kueri);

                while ($row = @mysqli_fetch_array($hasil)) {
                        $this->stopword[] = trim($row['name']);
                }
        }

        private function getDataTesting(){
                $kueri = "SELECT * FROM testing ORDER BY category ASC";
                $this->dataTesting = $this->conn->query($kueri);
        }       

        public function tambahKeIndex($file, $kelas) {
                $fh = fopen($file, 'r');
                $counter = 0;

                while($baris = fgets($fh)) {
                        $counter++;
                        $this->jmlDokumen++;
                        $this->jmlTokenDokumen[$kelas]++;
                        $tokens = $this->prepocessing($baris);
                        
                        foreach($tokens as $token) {
                                if(!isset($this->index[$token][$kelas])) {
                                        $this->index[$token][$kelas] = 0;
                                }
                                $this->index[$token][$kelas]++;
                                $this->jmlTokenKelas[$kelas]++;
                                $this->jmlToken++;
                        }
                }
                fclose($fh);
        }
        
        public function klasifikasi($dokumen) {
                $this->prior['pos'] = $this->jmlTokenDokumen['pos'] / $this->jmlDokumen;
                $this->prior['neg'] = $this->jmlTokenDokumen['neg'] / $this->jmlDokumen; 

                $tokens = $this->prepocessing($dokumen);                  
                $this->term = $tokens;
                $nilaiKelas = array();

                foreach($this->kelas as $k) {
                        $nilaiKelas[$k] = 1;
                        foreach($tokens as $token) {
                                $count = isset($this->index[$token][$k]) ? 
                                        $this->index[$token][$k] : 0;

                                $this->countwc[$token][$k] = $count;

                                $pwctoken = $count / ($this->jmlTokenKelas[$k] + $this->jmlToken);

                                $this->pwc[$token][$k] = $pwctoken;

                                $nilaiKelas[$k] *= $pwctoken;
                        }
                        $nilaiKelas[$k] = $this->prior[$k] * $nilaiKelas[$k];
                        $this->pcw[$k] = $nilaiKelas[$k];
                }
                arsort($nilaiKelas);
                return key($nilaiKelas);
        }

        private function prepocessing($dokumen) {
                //proses tokenisasi
                $dokumen = strtolower($dokumen);
                $hasilTokenisasi = array_unique(str_word_count(preg_replace('/-/', ' ', $dokumen), 1));

                //proses filtering
                foreach ($hasilTokenisasi as $key => $value) {
                        if(in_array($value, $this->stopword)){
                                unset($hasilTokenisasi[$key]);
                        }
                }    

                //proses stemming
                /*
                foreach ($hasilTokenisasi as $key => $value) {
                        $hasilTokenisasi[$key] = PorterStemmer::Stem($hasilTokenisasi[$key]);
                }
                */

                return $hasilTokenisasi;
        }
}
?>