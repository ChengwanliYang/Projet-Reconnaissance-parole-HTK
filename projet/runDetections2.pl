#!/usr/local/bin/perl

$HVITE="HVite";
$hviteConf="-T 1";
$LOC="projet";
$DIC="keywordsplus.dic";
$NET2="keywordsplus.net2";
$TEST="lex1.txt";


&HVite("lists/$DIC", "lists/$NET2", "lists/phonesHTK", "/Users/joliot/Desktop/sdl-info-sorbonne4/S3/praat-reconnaissance/$LOC", "donnees/lists/$TEST", "donnees/hmms/hmm.3/HMMmacro");
   

#-------------------------------------------------------------------------
# HVite: Décodage à l'aide des modèles de Markov  
#-------------------------------------------------------------------------
sub HVite {
    local($fileDic, $fileNet2, $hmmList, $refDir, $paramList, $HMM)=@_;
    
    &SambaFrToHTK($fileDic,"tmp/dic");		
	system("$HVITE $hviteConf -H $refDir/$HMM -i EN.rec -S $refDir/$paramList -w $fileNet2 tmp/dic $hmmList");
    }

#-------------------------------------------------------------------------
# SambaFrToHTK: Modification des étiquettes du format SampaFr au format HTK  
#-------------------------------------------------------------------------
sub SambaFrToHTK {
    local($fileList, $fileDic)=@_;
  	my @SambaFr = ("2","9","a~","e~","o~");
  	my @HTK = ("#2","#9","a#","e#","o#");
  
	open(FILELIST, $fileList);
	open(FILEDIC, ">$fileDic");
	while(<FILELIST>) {  
		chop($_);
		@liste = split(/ /,$_);
		print FILEDIC "$liste[0] ";
		for ($j = 1;$j<=$#liste;$j++) {
			for ($i=0;$i<=$#SambaFr;$i++) {
				$liste[$j] =~ s/$SambaFr[$i]/$HTK[$i]/;
			}
			printf FILEDIC "$liste[$j] ";
		}
		print FILEDIC "\n";
	}
	print FILEDIC "silence silence\n";
	close(FILELIST);
	close(FILEDIC);
}
    
