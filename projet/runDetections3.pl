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
	system("$HVITE $hviteConf -H $refDir/$HMM -S $refDir/$paramList -w $fileNet2 $fileDic $hmmList");
    }


    
