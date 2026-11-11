$TITLE    MODELE EXTER-MADA
$STITLE   ECONOMIE OUVERTE AVEC GOUVERNEMENT

*===================================================================================*
* EXTER-MADA                                                                        *
* Projet de modelisation                                                            *
*                                                                                   *
* Ce modèle est base sur l'architecture des modèles EXTER et PEP (version 2.1)      *
*                                                                                   *
* Sous licence : https://creativecommons.org/licenses/by-nc-sa/4.0/                  *
*                                                                                   *
* Vous êtes libre de partager, copier, distribuer et transmettre ce travail         *
* selon les conditions suivantes :                                                  *
*                                                                                   *
*   - Attribution :             Les travaux originaux doivent être attribues à :    *
*                               Veronique Robichaud, Andre Lemelin,                 *
*                               Helene Maisonnave et Bernard Decaluwe.              *
*                               Les adaptations et extensions de ce projet sont     *
*                               attribuees à Franck Ramaharo.                       *
*                                                                                   *
*   - Non commercial :          Vous ne pouvez pas utiliser ce travail              *
*                               à des fins commerciales.                            *                                             
*                                                                                   *
*   - Partage à l'identique :   Si vous modifiez, transformez ou developpez         *
*                               ce travail, vous devez distribuer le travail        *
*                               resultant uniquement sous une licence identique     *
*                               à celle-ci.                                         *
*                                                                                   *
*===================================================================================*

* --- DEFINITION DES ENSEMBLES ---

SET
** --- BRANCHE D'ACTIVITES ET PRODUITS ---
 I  Produits
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      PETR      "Produits petroliers"
      SER       "Service marchand"
      PUB       "Administration publique"
      OTHNTR    "Autres services non marchands"
    /

 TR(I) Produits marchands
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      PETR      "Produits petroliers"
      SER       "Service"
    /

 TRJ(TR) Produits et branches marchands
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      SER       "Service"
    /

 BNS(TR) Biens marchands non services
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      PETR      "Produits petroliers"
    /
 
 NPBNS(TR) Biens marchands non services hors PETR
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
    /

 J(I) Branches
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      SER       "Service"
      PUB       "Administration publique"
      OTHNTR    "Autres services non marchands"
    /

 NTR(J) Services non marchands
    / PUB       "Administration publique"
      OTHNTR    "Autres services non marchands"
    /
      
** --- AGENTS ---
 AG Tous les agents
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
      GVT       "Administration centrale"
      NGO       "Autres APU et ISBLSM"
      FIRM      "Societes"
      ROW       "Reste du monde"
    /

 AGD(AG) Agents domestiques
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
      GVT       "Administration centrale"
      NGO       "Autres APU et ISBLSM"
      FIRM      "Societes"
    /

 AGNGVT(AG) Agents non gouvernementaux
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
      NGO       "Autres APU et ISBLSM"
      FIRM      "Societes"
      ROW       "Reste du monde"
    /

 AGNTR(AGD) Agents publics
    / GVT       "Administration centrale"
      NGO       "Autres APU et ISBLSM"
    /
    
 H(AG) Menages
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
    /
    

** --- SCENARIOS ---
 SCEN Scenarios
    /BASE       "Valeurs initiales"
     SIM        "Valeurs apres choc"
     VAR        "Variation en poucentage"
    /
;


ALIAS (ag,agj)
ALIAS (tri,trj)
;


* --- DEFINITION DES PARAMETRES ET DES VARIABLES DE REFERENCE ---

PARAMETER
** --- DEFINITION DES PARAMETRES ---
    A(trj)              "Parametre d'echelle (Cobb-Douglas - fonction de production)"
    A_E(trj)            "Parametre d'echelle (CET - production)"
    A_M(trj)            "Parametre d'echelle (CES - produit composite)"
    aij(tr,j)           "Coefficient (Leontief - consommation intermediaire)"
    alpha(trj)          "Elasticite (Cobb-Douglas - fonction de production)"
    beta_E(trj)         "Parametre de repartition (CET - production)"
    beta_M(trj)         "Parametre de repartition (CES - produit composite)"
    eta                 "Elasticite-prix des transferts indexes et parametres"
    mu_CTNGO             "Part des autres APU et des ISBLSM dans la depense de consommation finale totale"
    mu_D                "Part de l'offre de produits petroliers allouee a la demande domestique"
    mu_E                "Part de l'offre de produits petroliers allouee a la reexportation"
    gamma_CH(tr,h)      "Part du produit tr dans les depenses totales de consommation du menage h"
    gamma_INV(tr)       "Part du produit tr dans les depenses totales d'investissement"
    io(j)               "Coefficient (Leontief - consommation intermediaire totale)"
    lambda(h)           "Part du revenu du capital recue part le menage h"
    lambda_R            "Part du revenu du capital recue part le reste du monde"
    ntyf                "Propension des Societes a verser des recettes non fiscales"
    ntyh(h)             "Propension du menage h a verser des recettes non fiscales"
    lambda_TRA(ag,agj)  "Part du revenu disponible de l'agent agj qui va a l'agent ag"
    phi(h)              "Part du revenu du travail recue part le menage h"
    psi(h)              "Propension moyenne a epargner du menage h"
    rho_E(trj)          "Parametre d'elasticite (CET - production)"
    rho_M(trj)          "Parametre d'elasticite (CES - produit composite)"
    sigma_E(trj)        "Elasticite de transformation (CET - production)"
    sigma_M(trj)        "Elasticite de substitution (CES - produit composite)"
    sntx(agntr)         "Part des recettes non fiscales versees par les menages et recues par l'agent agpub"
    syfi                "Part des autres impôts indirects sur le revenu entreprises "
    syfm                "Part des autres droits de douanes sur le revenu entreprises "
    theta(tr,trj)       "Part du produit tr dans la production domestique de la branche trj"
    tm(tr)              "Taux de droits de douane sur les importation en produit tr"
    tmgc(tr)            "Taux de marge commerciale du produit tr"
    tmgt(tr)            "Taux de marge de transport du produit tr"
    tx(tr)              "Taux de taxe indirecte sur le produit tr"
    tyf                 "Taux de taxe directe sur le revenu des entreprises"
    tyh(h)              "Taux de taxe directe sur le revenu du menage h"
    v(j)                "Coefficient (Leontief - valeur ajoutee)"


** --- DEFINITION  DES VARIABLES POUR L'ANNEE DE REFERENCE ---
*** --- VARIABLES EN VOLUMES ---    
    CHO(tr,h)           "Consommation du menage h en produit tr"
    CGO                 "Consommation de l'Administration centrale"
    CIO(j)              "Consommation intermediaire totale de la branche j"
    CNGOO               "Consommation des autres APU et des ISBLSM"
    CTH_reelO(h)        "Consommation reelle du menage h"
    DDO(tr)             "Demande de produit local tr"
    DIO(tr,j)           "Consommation intermediaire en produit tr par la branche j"
    DITO(tr)            "Demande intermediaire totale pour le produit tr"
    DSO(tr,trj)         "Offre de produit tr de la branche trj sur le marche local"
    DXO(trj)            "Production de la branche trj sur le marche local"
    EXO(tr)             "Exportations du produit tr"
    FBCF_reelO          "Formation brute de capital fixe"
    IMO(tr)             "Importations du produit tr"
    INVO(tr)            "Demande finale en produit tr pour fins d investissement"
    KDO(trj)            "Demande de capital de la branche trj"
    KD_RO               "Remuneration nominale du capital versee par le RDM"
    KSO(trj)            "Offre de capital dans la branche trj"
    LDO(i)              "Demande de travail de la branche j(i)"
    LD_RO               "Demande de travail du RDM"
    LSO                 "Offre totale de travail"
    MRGCOMO(bns)        "Marge de commercialisation du produit bns"
    MRGTRPO(bns)        "Marge de transport du produit bns"  
    PIB_MP_reelO        "PIB reel aux prix du marche"
    PIB_BP_reelO        "PIB reel aux prix de base"
    QO(tr)              "Demande en produit composite tr"
    VAO(i)              "Valeur ajoutee de la branche j(i)"
    VSTKO(bns)          "Variation de stocks du produit bns"
    XSO(i)              "Production de la branche j(i)"

*** --- VARIABLES EN VALEURS ---
    CABO                "Solde du compte courant"
    CTGO                "Budget de consommation finale de l'Administration centrale"    
    CTHO(h)             "Budget de consommation du menage h"
    CTNGOO              "Budget de consommation finale des autres APU et des ISBLSM"
    FBCFO               "Formation brute de capital fixe nominale"
    ITO                 "Investissement total"
    NTXFO               "Recettes non fiscales provenant des Societes"
    NTXHO(h)            "Recettes non fiscales provenant du menages h"
    NTXHHO(agntr)       "Recettes non fiscales provenant des menages recus par l'agent agntr"
    PIB_BPO             "PIB nominal aux prix de base"
    PIB_FDO             "PIB nominal (approche demande finale)"
    PIB_IBO             "PIB nominal (approche revenus)"
    PIB_MPO             "PIB nominal aux prix du marche"
    SFO                 "Epargne des Societes"
    SGO                 "Epargne de l'Administration centrale"
    SHO(h)              "Epargne du menage h"
    SNGOO               "Epargne des autres APU et des ISBLSM"
    SROWO               "Epargne du Reste du Monde"
    TDFO                "Recettes provenant des taxes directes sur les societes"
    TDHO(h)             "Recettes provenant des taxes directes sur le menage h"
    TIFO                "Recettes provenant des autres taxes indirectes des societes"
    TIMFO               "Recettes provenant des autres tarifs douaniers des societes"
    TIMO(tr)            "Recettes provenant des tarifs douaniers sur le produit tr"
    TIO(tr)             "Recettes provenant des taxes indirectes sur le produit tr"
    TRAO(ag,agj)        "Transferts nominaux de l agent agj vers l agent ag"
    YDHO(h)             "Revenu disponible nominal du menage h"
    YDFO                "Revenu disponible des societes"
    YFKO                "Revenu du capital des societes"
    YFO                 "Revenu total des societes"
    YFTRAO              "Revenu des transferts recus par les societes"
    YGO                 "Revenu total de l'Administration centrale"
    YGTRAO              "Revenu des transferts recus par l'Administration centrale"
    YGTXO               "Revenu des recettes fiscales de l'Administration centrale"
    YGNTXO              "Revenu des recettes non fiscales de l'Administration centrale"
    YHKO(h)             "Revenu du capital du menage h"
    YHLO(h)             "Revenu du travail du menage h"
    YHO(h)              "Revenu total nominal du menage h"
    YHTRAO(h)           "Revenu des transferts recu par le menage h"
    YNGOO               "Revenu total des autres APU et des ISBLSM"
    YROWKO              "Revenu du capital provenant du Reste du Monde"
    YROWLO              "Revenu du travail provenant du Reste du Monde"
    YROWO               "Revenu total du Reste du Monde"

*** --- PRIX ---
    eO                  "Taux de change nominal"
    PCO(tr)             "Prix du produit composite tr"
    PCIO(j)             "Indice des prix a la consommation intermediaire de la branche j"
    PDO(tr)             "Prix du produit tr sur le marche local (taxes et marges incluses)"
    PEO(tr)             "Prix au producteur du produit exporte tr"
    PIXPIBO             "Deflateur du PIB"
    PIXCONO             "Indice des prix a la consommation"
    PIXINVO             "Indice des prix des investissements"
    PLO(tr)             "Prix du produit tr sur le marche local (hors taxes et hors marges)"
    PMO(tr)             "Prix du produit importe tr (droits de douane et taxes inclus)"
    PO(i)               "Prix au producteur de la branche j(i)"
    PPDO(tr)            "Prix du produit tr sur le marche local (taxes incluses; hors marges)"
    PPMO(tr)            "Prix du produit importe tr (taxes incluses; hors marges)"
    PVAO(i)             "Prix de la valeur ajoutee de la branche j"
    PWEO(tr)            "Prix mondial (en devises) du produit exporte tr"
    PWMO(tr)            "Prix mondial (en devises) du produit importe tr"
    RO(trj)             "Taux de remuneration du capital de la branche trj"
    R_RO                "Taux de remuneration du capital du RDM (en devises)"
    WO                  "Taux de salaire des travailleurs domestiques"
    W_RO                "Taux de salaire des travailleurs du RDM (en devises)"
;

*** --- BLOC FINANCIER ---
* --- Agregats monetaires et banques ---
PARAMETER
    D_MDO               "Variation de la demande de monnaie"
    D_MSO               "Variation de l'offre de monnaie"
    MDO                 "Demande de monnaie (Masse monetaire)"
    MDOO                "Demande de monnaie (Annee t-1)"
    MSO                 "Offre de monnaie"
    MSOO                "Offre de monnaie (Annee t-1)"

* --- Taux de change et reserves de change ---
    CH_GAINO            "Gains de change nets"
    D_ERO               "Variation du taux de change de fin de periode"
    D_RESO              "Variation des reserves internationales"
    ERO                 "Taux de change de fin de periode (Annee t)"
    EROO                "Taux de change de fin de periode (Annee t-1)"
    g_ER                "Ecart relatif entre taux de change moyen et de fin de periode"
    RESO                "Stock de reserves internationales (Avoirs exterieurs nets)"
    RESOO               "Stock de reserves internationales (Annee t-1)"
    TRANS_FLOWO         "Flux de transaction"

* --- Secteur public (Administration centrale) ---
    AMORTGO             "Amortissement de la dette publique"
    BRGO                "Besoin de financement de l'Administration centrale"
    CAPGO               "Gains en capital de l'administration centrale"
    D_BGO               "Emprunt de l'Administration centrale aupres du secteur prive"
    D_DCGO              "Variation des credits bancaires a l'Etat"
    D_NFDG_PRGO         "Financement exterieur net - Prets programmes"
    D_NFDG_PRJO         "Financement exterieur net - Prets projets"
    D_NFDGO             "Financement exterieur net total de l'administration centrale"
    DCGO                "Credits bancaires a l'Etat (Stock)"
    DCGOO               "Credits bancaires a l'Etat (Stock, Annee t-1)"
    DINVGO              "Investissement public sur financement interieur"
    DEBTGO              "(Stock de la) dette publique totale"
    DEBTGOO             "(Stock de la) dette publique totale (Annee t-1)"
    DEFGO               "Deficit budgetaire"
    FINVGO              "Investissement public sur financement exterieur"
    INVGO               "Investissement public total (Depenses en capital)"
    KTRAGO              "Transferts de capital recus par l'Etat (Dons en capital)"
    NDDGO               "(Stock de la) dette publique interieure"
    NDDGOO              "(Stock de la) dette publique interieure (Annee t-1)"
    NFDGO               "(Stock de la) dette publique exterieure"
    NFDGOO              "(Stock de la) dette publique exterieure (Annee t-1)"
    TOTGO               "Dépenses totales de l'Administration Centrale"

* --- Secteur prive ---
    INVPO               "Investissement du secteur prive"
    SPO                 "Epargne du secteur prive"
    D_DCPO              "Variation des credits bancaires au secteur prive"
    D_NFDPO             "Financement exterieur net du secteur prive"
    DCPO                "Credits bancaires au secteur prive (Stock)"
    DCPOO               "Credits bancaires au secteur prive (Stock, Annee t-1)"
    CAPPO               "Gains en capital du secteur prive"
    OTHKTRAO            "Transferts de capital recus par le secteur prive"

* --- Investissements Directs etrangers (IDE) ---
    FDI_NETO            "Flux nets d'Investissements Directs Etrangers (IDE)"
    FDI_INO             "Entrees brutes d'IDE (Flux entrants)"
    FDI_OUTO            "Sorties brutes d'IDE (Flux sortants)"

* --- Paramètres de comportement et ratios ---
    psi_BG              "Propension du secteur prive a souscrire aux titres publics"
    psi_DCP             "Ratio de financement de l'investissement prive par le credit bancaire"
    psi_EX              "Ratio dette publique exterieure - exportations"
    vel                 "Vitesse de circulation de la monnaie"
;

PARAMETER
* --- Definition des indicateurs usuels ---
    DEFG_PIB(scen)      "Deficicit de l'Administration centrale (en pourcentage du PIB)"
    YGTX_PIB(scen)      "Taux de pression fiscale (en pourcentage du PIB)"
    DEBTG_PIB(scen)     "Stock de la dette publique (en pourcentage du PIB)"
    growth_PIB(scen)    "Taux de croissance du PIB (en pourcentage)"
    TOTG_PIB(scen)      "Depenses totales de l'Administration centrale (en pourcentage du PIB)"
    mu_RES(scen)        "Reserves en mois d importation"
;



* --- CHARGEMENT DE LA MATRICE DE COMPTABILITE SOCIALE ---
PARAMETER
    SAM(*,*,*,*)
    FSAM(*,*,*,*)
    AUX(*,*)
;



$CALL GDXXRW.EXE i="..\data\Exter-Mada.xlsx" par=SAM rng=MIDISAM!A1:Ak37  Rdim=2 Cdim=2 par=FSAM rng=FSAM!A1:K11 Rdim=2 Cdim=2 par=AUX rng=AUX!A1:B8 Rdim=1 Cdim=1 

$GDXIN Exter-Mada.gdx
$LOAD SAM
$LOAD FSAM
$LOAD AUX
$GDXIN



* --- ASSIGNATION DES VARIABLES DE LA MCS ---
 CABO                = SAM('OTH','INV','AG','ROW');
 CHO(tr,h)           = SAM('I',tr,'AG',h); 
 DIO(tr,j)           = SAM('I',tr,'J',j);
 DSO(tr,trj)         = SAM('J',trj,'I',tr);
 TDFO                = SAM('AG','TDM','AG','FIRM');
 TDHO(h)             = SAM('AG','TDM','AG',h);
 EXO(tr)             = SAM('X',tr,'AG','ROW');
 CTGO                = SAM('I','PUB','AG','GVT');
 CTNGOO              = SAM('I','OTHNTR','AG','NGO');
 IMO(tr)             = SAM('AG','ROW','I',tr);
 ITO                 = SAM('OTH','TOT','OTH','INV');
 INVO(tr)            = SAM('I',tr,'OTH','INV');
 KD_RO               = SAM('F','KD','AG','ROW');
 KDO(trj)            = SAM('F','KD','J',trj);
 LD_RO               = SAM('F','LD','AG','ROW');
 LDO(j)              = SAM('F','LD','J',j);
 MRGCOMO(bns)        = SAM('M','MC','I',bns);
 MRGTRPO(bns)        = SAM('M','MT','I',bns);
 NTXFO               = SAM('AG','NTX','AG','FIRM');
 NTXHO(h)            = SAM('AG','NTX','AG',h);
 NTXHHO('ngo')       = SAM('AG','NGO','AG','NTX');
 SFO                 = SAM('OTH','INV','AG','FIRM');
 SGO                 = SAM('OTH','INV','AG','GVT');
 SHO(h)              = SAM('OTH','INV','AG',h);
 SNGOO               = SAM('OTH','INV','AG','NGO');
 SROWO               = SAM('OTH','INV','AG','ROW');
 TIFO                = SAM('AG','TBS','AG','FIRM');
 TIMFO               = SAM('AG','TCM','AG','FIRM');
 TIMO(tr)            = SAM('AG','TCM','I',tr);
 TIO(tr)             = SAM('AG','TBS','I',tr);
 TRAO(ag,agj)        = SAM('AG',ag,'AG',agj);
 VSTKO(bns)          = SAM('I',bns,'OTH','VSTK');
 YFO                 = SAM('OTH','TOT','AG','FIRM');
 YFKO                = SAM('AG','FIRM','F','KD');
 YGO                 = SAM('OTH','TOT','AG','GVT');
 YGNTXO              = SAM('AG','GVT','AG','NTX');
 YHO(h)              = SAM('OTH','TOT','AG',h);
 YHKO(h)             = SAM('AG',h,'F','KD');
 YHLO(h)             = SAM('AG',h,'F','LD');
 YNGOO               = SAM('AG','NGO','OTH','TOT');
 YROWO               = SAM('AG','ROW','OTH','TOT');
 YROWKO              = SAM('AG','ROW','F','KD');
 YROWLO              = SAM('AG','ROW','F','LD');

* --- ASSIGNATION DES VARIABLES DE LA MCSF --- 
 D_MDO               = FSAM('F','DFIN','F','PFIN');
 D_RESO              = FSAM('F','FFIN','F','DFIN');
 AMORTGO             = FSAM('F','FFIN','F','GFIN');
 
 CH_GAINO            = FSAM('F','FFIN','K','KGAIN');
 FDI_NETO            = FSAM('F','FFDI','F','FFIN');
 FDI_OUTO            = FSAM('F','FFDI','F','PFIN');
 FDI_INO             = FSAM('F','PFIN','F','FFDI');

 D_DCGO              = FSAM('F','GFIN','F','DFIN');
 D_NFDGO             = FSAM('F','GFIN','F','FFIN');
 D_BGO               = FSAM('F','GFIN','F','PFIN');
 KTRAGO              = FSAM('F','GFIN','K','KTRA');
 
 D_DCPO              = FSAM('F','PFIN','F','DFIN');
 D_NFDPO             = FSAM('F','PFIN','F','FFIN');
 OTHKTRAO            = FSAM('F','PFIN','K','KTRA');
 
 TRANS_FLOWO         = FSAM('K','KGAIN','F','DFIN');
 
 INVGO               = FSAM('OTH','INV','F','GFIN');
 INVPO               = FSAM('OTH','INV','F','PFIN');


* --- ASSIGNATION DES VARIABLES AUXILIAIRES --- 
 MDO                 = AUX('MD','Valeur');
 RESO                = AUX('RES','Valeur');
 D_NFDG_PRGO         = AUX('D_NFDG_PRG','Valeur');
 NFDGO               = AUX('NFDG','Valeur');
 NDDGO               = AUX('NDDG','Valeur');
 DCGO                = AUX('DCG','Valeur');
 DCPO                = AUX('DCP','Valeur');

* --- AUTRES VALEURS PAR BRANCHE ---
TABLE AUTRE1(*,trj) Autres donnees par branche

                 AGR        FOOD     OTHIND      SER
 RO              1          1        1           1
 sigma_E         0.485      0.485    0.485       0.485
 sigma_M         0.789      0.789    0.789       0.789
;

TABLE AUTRE2(*,tr) Autres donnees par produit

                AGR        FOOD      OTHIND   PETR      SER
 PLO            1          1         1        1         1
 PWMO           1          1         1        1         1
 PEO            1          1         1        1         1
;

** --- ASSIGNATION DES VARIABLES DU TABLEAU AUTRE ---
 RO(trj)        = AUTRE1('RO',trj);
 sigma_E(trj)   = AUTRE1('sigma_E',trj);
 sigma_M(trj)   = AUTRE1('sigma_M',trj);

 PLO(tr)        = AUTRE2('PLO',tr);
 PWMO(tr)       = AUTRE2('PWMO',tr);
 PEO(tr)        = AUTRE2('PEO',tr);
 
** --- ELASTICITE PRIX ---
 eta             = 1;
 
** --- AUTRES VALEURS ---
 eO             = 1;
 PO(ntr)        = 1;
 WO             = 1;
 R_RO           = 1;
 W_RO           = 1;


* --- AUTRES VALEURS ---
** --- TAUX DE TAXE ---
 syfi       = TIFO/YFO;
 syfm       = TIMFO/YFO;
 
 tyf        = TDFO/YFO;
 tyh(h)     = TDHO(h)/YHO(h);
 
 tm(tr)                 = TIMO(tr)/IMO(tr);
 tx(bns)$npbns(bns)     = TIO(bns)/{SUM[trj, DSO(bns,trj)] + IMO(bns) + TIMO(bns) + MRGCOMO(bns) + MRGTRPO(bns)}; 
 tx('ser')              = TIO('ser')/{SUM[trj, DSO('ser',trj)] + IMO('ser') + TIMO('ser')};


** --- TAUX DE PRELEVEMENT NON FISCAL ---
 sntx('gvt')    = (YGNTXO - NTXFO)/SUM[h, NTXHO(h)];
 sntx('ngo')    = 1 - sntx('gvt');


** --- AUTRES VARIABLES ET PRIX ---
 TRAO(agd, 'row')   = TRAO(agd, 'row')/eO;
 TRAO('row', agd)   = TRAO('row', agd)/eO;
 SROWO              = SROWO/eO;
 YROWO              = YROWO/eO;
 YROWKO             = YROWKO/eO;
 YROWLO             = YROWLO/eO;
 

 PPDO(tr)       = {1 + tx(tr)}*PLO(tr); 
 PPMO(tr)       = {1 + tx(tr)}*{1 + tm(tr)}*eO*PWMO(tr);
 PDO('ser')     = PPDO('ser');
 PMO('ser')     = PPMO('ser');  
 PWEO(tr)       = PEO(tr)/eO;

 LDO(j)         = LDO(j)/WO;
 LD_RO          = LD_RO/(eO*W_RO);
 KDO(trj)       = KDO(trj)/RO(trj);
 KD_RO          = KD_RO/(eO*R_RO);
 
 EXO(tr)        = EXO(tr)/PEO(tr);
 IMO(tr)        = IMO(tr)/(eO*PWMO(tr));

 DSO(tr,trj)    = DSO(tr,trj)/PLO(tr);
 DDO(tr)        = SUM[trj, DSO(tr,trj)];
 DXO(trj)       = SUM[tr, DSO(tr,trj)];

 QO(tr)         = IMO(tr) + DDO(tr);
  
 PCO('ser')     = {PDO('ser')*DDO('ser') + PMO('ser')*IMO('ser')}/QO('ser');

 MRGCOMO(bns)   = MRGCOMO(bns)/PCO('ser');
 MRGTRPO(bns)   = MRGTRPO(bns)/PCO('ser');

 tmgc(bns)      = MRGCOMO(bns)/{IMO(bns) + DDO(bns)};
 tmgt(bns)      = MRGTRPO(bns)/{IMO(bns) + DDO(bns)};
 
 PDO(bns)       = PPDO(bns) + {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PCO('ser');
 PMO(bns)       = PPMO(bns) + {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PCO('ser');
 
 PCO(bns)       = {PDO(bns)*DDO(bns) + PMO(bns)*IMO(bns)}/QO(bns); 
 
 CHO(tr,h)      = CHO(tr,h)/PCO(tr);
 INVO(tr)       = INVO(tr)/PCO(tr);
 VSTKO(bns)     = VSTKO(bns)/PCO(bns);
 FBCFO          = ITO - SUM[bns, PCO(bns)*VSTKO(bns)];
 DIO(tr,j)      = DIO(tr,j)/PCO(tr);
 
 DITO(tr)       = SUM[j, DIO(tr,j)]; 
 CIO(j)         = SUM[tr, DIO(tr,j)];
 
 mu_D           = {SUM[h, CHO('petr',h)] + DITO('petr') + INVO('petr')}/QO('petr');
 mu_E           = EXO('petr')/QO('petr');
 
 PCIO(j)        = SUM[tr, PCO(tr)*DIO(tr,j)]/CIO(j);

 XSO(trj)       = DXO(trj) + EXO(trj);
 XSO('pub')     = CTGO/PO('pub'); 
 XSO('othntr')  = CTNGOO/PO('othntr'); 
 CGO            = XSO('pub');
 CNGOO          = XSO('othntr');

 PO(trj)        = {PEO(trj)*EXO(trj) + SUM[tr, PLO(tr)*DSO(tr,trj)]}/XSO(trj);

 VAO(trj)       = LDO(trj) + KDO(trj);
 VAO(ntr)       = LDO(ntr);
 
 PVAO(j)        = {PO(j)*XSO(j) - PCIO(j)*CIO(j)}/VAO(j);
  
 LSO            = LD_RO + SUM[j, LDO(j)];
 KSO(trj)       = KDO(trj);

* PIXPIBO        = SUM[j, PVAO(j)*VAO(j)]/SUM[j, PVAO(j)*VAO(j)];
 PIXPIBO        = 1;

* PIXCONO        = SUM[tr, PCO(tr)*SUM[h, CHO(tr,h)]]/SUM[tr, PCO(tr)*SUM[h, CHO(tr,h)]];
 PIXCONO        = 1;

* PIXINVO        = PROD[tr, (PCO(tr)/PCO(tr))**gamma_INV(tr)];
 PIXINVO        = 1;
 
 YHTRAO(h)      = TRAO(h,'firm') + TRAO(h,'gvt') + TRAO(h,'ngo') + eO*TRAO(h,'row');
 YDHO(h)        = YHO(h) - TDHO(h);
 CTHO(h)        = YDHO(h) - SHO(h)  - NTXHO(h);
 
 YGTXO          = SUM[tr, TIO(tr)] + TIFO + SUM[tr, TIMO(tr)] + TIMFO + TDFO + SUM[h, TDHO(h)];
 NTXHHO('gvt')  = sntx('gvt')*SUM[h, NTXHO(h)];
 YGNTXO         = NTXFO + NTXHHO('gvt');
 YGTRAO         = eO*TRAO('gvt','row');

 YFTRAO         = TRAO('firm','gvt') + eO*TRAO('firm', 'row');
 YDFO           = YFO - TDFO - TIFO - TIMFO; 
 
 CABO           = -SROWO;
 
 TRAO(agd,'row')    = TRAO(agd,'row')/PIXCONO**eta;
 TRAO(agngvt,'gvt') = TRAO(agngvt,'gvt')/PIXCONO**eta;
 TRAO(h,'ngo')      = TRAO(h,'ngo')/PIXCONO**eta;

* --- CALIBRAGE DES PARAMETRES ---
** --- PRODUCTION (COBB-DOUGLAS ET LEONTIEF) ---
 alpha(trj)      = WO*LDO(trj)/{PVAO(trj)*VAO(trj)};
 A(trj)          = VAO(trj)/{LDO(trj)**alpha(trj)*KDO(trj)**(1 - alpha(trj))};

 v(j)            = VAO(j)/XSO(j);
 io(j)           = CIO(j)/XSO(j);
 aij(tr,j)       = DIO(tr,j)/CIO(j);
 theta(tr,trj)   = DSO(tr,trj)/DXO(trj);

** --- PARAMETRES DISTRIBUTIFS  ---
 gamma_CH(tr,h)  = PCO(tr)*CHO(tr,h)/CTHO(h);
 phi(h)          = YHLO(h)/{eO*W_RO*LD_RO + SUM[j, WO*LDO(j)]};
 lambda(h)       = YHKO(h)/{eO*R_RO*KD_RO + SUM[trj, RO(trj)*KDO(trj)]};
 lambda_R        = 1 - SUM[h, lambda(h)] - YFKO/{eO*R_RO*KD_RO + SUM[trj, RO(trj)*KDO(trj)]};
 mu_CTNGO        = CTNGOO/{CTGO + CTNGOO + SUM[h, CTHO(h)]};
 psi(h)          = SHO(h)/YDHO(h);
 gamma_INV(tr)   = PCO(tr)*INVO(tr)/FBCFO;
 
** --- PARAMETRES DES FONCTIONS DE TRANSFERTS ---
 lambda_TRA('ngo','firm')   = TRAO('ngo','firm')/YDFO;
 lambda_TRA(h,'firm')       = TRAO(h,'firm')/YDFO;

** --- PARAMETRES DES PRELEVEMENTS NON FISCAUX ---
 ntyf       = NTXFO/YDFO;
 ntyh(h)    = NTXHO(h)/YDHO(h);
  
** --- COMMERCE INTERNATIONAL ---
*** --- EXPORTATIONS (CET) ---
 rho_E(trj)       = {1 + sigma_E(trj)}/sigma_E(trj);

 beta_E(trj)      = PEO(trj)*EXO(trj)**(1 - rho_E(trj))/
                    {PEO(trj)*EXO(trj)**(1 - rho_E(trj)) + SUM[tr, theta(tr,trj)*PLO(tr)]*DXO(trj)**(1 - rho_E(trj))};

 A_E(trj)         = XSO(trj)/{beta_E(trj)*EXO(trj)**rho_E(trj)
                    + (1 - beta_E(trj))*DXO(trj)**rho_E(trj)}**(1/rho_E(trj));

*** --- IMPORTATIONS (CES) ---
 rho_M(trj)       = (1 - sigma_M(trj))/sigma_M(trj);

 beta_M(trj)      = PMO(trj)*IMO(trj)**(rho_M(trj) + 1)/
                    {PMO(trj)*IMO(trj)**(rho_M(trj) + 1)
                    + PDO(trj)*DDO(trj)**(rho_M(trj) + 1)};

 A_M(trj)         = QO(trj)/{beta_M(trj)*IMO(trj)**(-rho_M(trj))
                    + (1 - beta_M(trj))*DDO(trj)**(-rho_M(trj))}**(-1/rho_M(trj));
                   
** --- PRODUIT INTERIEUR BRUT ---
 PIB_BPO        = SUM[j, PVAO(j)*VAO(j)];
 PIB_MPO        = PIB_BPO + SUM[tr, TIMO(tr) + TIO(tr)];
 PIB_IBO        = SUM[j, WO*LDO(j)] + SUM[trj, RO(trj)*KDO(trj)] + SUM[tr, TIMO(tr) + TIO(tr)];
 PIB_FDO        = SUM[tr, SUM[h, PCO(tr)*CHO(tr,h)]]
                    + CTGO + CTNGOO
                    + SUM[bns, PCO(bns)*{INVO(bns) + VSTKO(bns)}]
                    + PCO('ser')*INVO('ser') + eO*SUM[tr, PWEO(tr)*EXO(tr)]
                    - eO*SUM[tr, PWMO(tr)*IMO(tr)];
                    
** --- AUTRES VARIABLES REELLES ---

 CTH_reelO(h)   = CTHO(h)/PIXCONO;
 PIB_BP_reelO   = PIB_BPO/PIXPIBO;
 PIB_MP_reelO   = PIB_MPO/PIXCONO;
 FBCF_reelO     = FBCFO/PIXINVO;
 

** --- BLOC FINANCIER ---
 FDI_INO        = FDI_INO/EO;
 FDI_OUTO       = FDI_OUTO/EO;
 FDI_NETO       = FDI_NETO/EO;
 AMORTGO        = AMORTGO/EO;
 OTHKTRAO       = OTHKTRAO/EO;
 KTRAGO         = KTRAGO/EO;
 D_NFDGO        = D_NFDGO/EO;
 D_NFDPO        = D_NFDPO/EO;
 D_NFDG_PRGO    = D_NFDG_PRGO/EO;
 D_NFDG_PRJO    = D_NFDGO - D_NFDG_PRGO;
 D_NFDGO        = D_NFDG_PRGO + D_NFDG_PRJO - AMORTGO;
 
 FINVGO         = KTRAGO + D_NFDG_PRJO;
 DINVGO         = INVGO - EO*FINVGO;
 
 BRGO           = INVGO - SGO;
 DEFGO          = -BRGO;
 SPO            = SNGOO + SFO + SUM[h, SHO(h)];
 psi_BG         = D_BGO/SPO;
 TOTGO          = CTGO + SUM[agngvt$(not sameas(agngvt, 'row')), TRAO(agngvt, 'gvt')]
                    + eO*TRAO('row', 'gvt') + INVGO;
                    
 INVPO          = ITO - INVGO;
 psi_DCP        = D_DCPO/INVPO;
 
 vel            = PIB_MPO/MDO;
 MDOO           = MDO - D_MDO;
 D_MSO          = D_MDO;
 MSO            = MDO;
 MSOO           = MDOO;

 g_ER           = CH_GAINO/D_RESO;
 ERO            = EO/(1 + g_ER);
 D_RESO         = D_RESO/ERO;
 RESO           = RESO/ERO;
 RESOO          = RESO - D_RESO;
 

 D_ERO          = TRANS_FLOWO/RESOO;
 EROO           = ERO - D_ERO;
 

 NFDGO          = NFDGO/ERO;
 NFDGOO         = NFDGO - D_NFDGO;
 NDDGOO         = NDDGO - (D_DCGO + D_BGO);
 
 DEBTGO         = ERO*NFDGO + NDDGO;
 DEBTGOO        = EROO*NFDGOO + NDDGOO;
 
 psi_EX         = NFDGO/SUM[tr, PWEO(tr)*EXO(tr)];
 
 DCGOO          = DCGO - D_DCGO;
 DCPOO          = DCPO - D_DCPO;

*---- Indicateurs --------
 DEFG_PIB('base')    = DEFGO/PIB_MPO*100;
 ygtx_PIB('base')    = YGTXO/PIB_MPO*100;
 DEBTG_PIB('base')   = DEBTGO/PIB_MPO*100;
 growth_PIB('base')  = (PIB_MP_reelO/PIB_MP_reelO - 1)*100;
 mu_RES('base')      = RESO/(SUM[tr, PWMO(tr)*IMO(tr)]/12);
 TOTG_PIB('base')    = TOTGO/PIB_MPO*100;
 
 
 DISPLAY
    A,              A_E,            A_M,            aij,            alpha,          
    beta_E,         beta_M,
    eta,
    g_ER,           gamma_CH,       gamma_INV,
    io,
    lambda,         lambda_R,       lambda_TRA,     
    mu_CTNGO        mu_D,           mu_E,
    ntyf,           ntyh,
    phi,            psi,            psi_BG,         psi_DCP,        psi_EX       
    rho_E,          rho_M,          
    sigma_E,        sigma_M,        sntx,           syfi,           syfm,
    theta,          tm,             tmgc,           tmgt,           tx,             tyf,    tyh,
    v,              vel
    ;
 

* --- DECLARATION DES VARIABLES ---

VARIABLES
** --- VOLUMES ---
    CG              "Consommation de l'Administration centrale"
    CH(tr,h)        "Consommation du menage h en produit tr"
    CNGO            "Consommation des Autres APU et des ISBLSM"
    CI(j)           "Consommation intermediaire totale de la branche j"
    CTH_reel(h)     "Budget de consommation du menage h"
    DD(tr)          "Demande de produit local tr"
    DI(tr,j)        "Consommation intermediaire en produit tr par la branche j"
    DIT(tr)         "Demande intermediaire totale pour le produit tr"
    DS(tr,trj)      "Offre de produit tr de la branche trj sur le marche local"
    DX(trj)         "Production de la branche trj sur le marche local"
    EX(tr)          "Exportations du produit tr"
    FBCF_reel       "Formation brute de capital fixe"
    IM(tr)          "Importations du produit tr"
    INV(tr)         "Demande finale en produit tr pour fins d investissement"
    KD(trj)         "Demande de capital de la branche tr"
    KD_R            "Deamnde de capital du RDM"
    KS(trj)         "Offre de capital dans la branche tr"
    LD(i)           "Demande de travail de la branche j(i)"
    LD_R            "Demande de travail du RDM"
    LS              "Offre totale de travail"
    MRGCOM(bns)     "Marge de commercialisation du produit bns"
    MRGTRP(bns)     "Marge de transport du produit bns"
    PIB_MP_reel     "Produit Interieur Brut aux prix du marche"
    PIB_BP_reel     "Produit Interieur Brut aux prix de base"
    Q(tr)           "Demande en produit composite tr"
    VA(i)           "Valeur ajoutee de la branche j(i)"
    VSTK(tr)        "Variation de stocks du produit bns"
    XS(i)           "Production de la branche j(i)"

    
** --- VALEURS NOMINALES ---
    CAB             "Balance courante"
    CTG             "Budget de consommation finale de l'Administration centrale"
    CTH(h)          "Budget de consommation finale du menage h"
    CTNGO           "Budget de consommation finale des Autres APU et des ISBLSM"
    FBCF            "Formation brute de capital fixe nominale"
    IT              "Investissement total nominal"
    NTXF            "Recettes non fiscales provenant des Societes"
    NTXH(h)         "Recettes non fiscales provenant du menages h"
    NTXHH(agntr)    "Recettes non fiscales provenant des menages recus par l'agent agntr"
    PIB_BP          "PIB nominal aux prix de base"
    PIB_FD          "PIB nominal (approche demande finale)"
    PIB_IB          "PIB nominal (approche revenus)"
    PIB_MP          "PIB nominal aux prix du marche"
    SF              "Epargne des Societes"
    SG              "Epargne de l'Administration centrale"
    SH(h)           "Epargne du menage h"
    SNGO            "Epargne des autres APU et des ISBLSM"
    SROW            "Epargne du Reste du Monde"
    TDF             "Recettes provenant des taxes directes sur les entreprises"
    TDH(h)          "Recettes provenant des taxes directes sur le menage h"
    TIF             "Recettes provenant des autres taxes indirectes des entreprises"
    TIMF            "Recettes provenant des autres tarifs douaniers des entreprises"
    TIM(tr)         "Recettes provenant des tarifs douaniers sur le produit tr"
    TI(tr)          "Recettes provenant des taxes indirectes sur le produit tr"
    TRA(ag,agj)     "Transferts nominaux de l agent agj vers l agent ag"
    YDH(h)          "Revenu disponible nominal du menage h"
    YDF             "Revenu disponible des entreprises"
    YF              "Revenu total des societes"
    YFK             "Revenu du capital des entreprises"
    YFTRA           "Revenu des transferts recus par les societes"
    YG              "Revenu total de l'Administration centrale"
    YGTRA           "Revenu des transferts recus par l'Administration centrale"
    YGTX            "Revenu des recettes fiscales de l'Administration centrale"
    YGNTX           "Revenu des recettes non fiscales de l'Administration centrale"
    YH(h)           "Revenu total nominal du menage h"
    YHK(h)          "Revenu du capital du menage h"
    YHL(h)          "Revenu du travail du menage h"
    YHTRA(h)        "Revenu des transferts recu par le menage h"
    YNGO            "Revenu total des autres APU et des ISBLSM"
    YROW            "Revenu total du Reste du Monde"
    YROWK           "Revenu du capital provenant du Reste du Monde"
    YROWL           "Revenu du travail provenant du Reste du Monde"

** --- PRIX ET INDICES ---
    e               "Taux de change nominal"
    P(i)            "Prix au producteur de la branche j(i)"
    PC(tr)          "Prix du produit composite tr"
    PCI(j)          "Indice des prix a la consommation intermediaire de la branche j"
    PD(tr)          "Prix du produit tr sur le marche local (taxes et marges incluses)"
    PE(tr)          "Prix au producteur du produit exporte tr"
    PIXPIB          "Deflateur du PIB"
    PIXCON          "Indice des prix a la consommation"
    PIXINV          "Indice des prix des investissements"
    PL(tr)          "Prix du produit tr sur le marche local (hors taxes)"
    PM(tr)          "Prix du produit importe tr (droits de douane et taxes inclus)"
    PPD(tr)         "Prix du produit tr sur le marche local (taxes incluses hors marges)"
    PPM(tr)         "Prix du produit importe tr (taxes incluses hors marges)"
    PVA(i)          "Prix de la valeur ajoutee de la branche j(i)"
    PWE(tr)         "Prix mondial (en devises) du produit exporte tr"
    PWM(tr)         "Prix mondial (en devises) du produit importe tr"
    R(trj)          "Taux de remuneration du capital de la branche trj"
    R_R             "Taux de remuneration du capital du RDM (en devises)"
    W               "Taux de salaire des travailleurs domestiques"
    W_R             "Taux de salaire des travailleurs du RDM (en devises)"

** --- VERIFICATION DE LA LOI DE WALRAS ---
    LEON            "Loi de Walras"
    

** --- BLOC FINANCIER ---
*** --- Agregats monetaires et banques ---
    D_MD            "Variation de la demande de monnaie"
    D_MS            "Variation de l'offre de monnaie"
    MD              "Demande de monnaie (Masse monetaire)"
    MS              "Offre de monnaie"

*** --- Taux de change et reserves de change ---
    D_ER            "Variation du taux de change de fin de periode"
    D_RES           "Variation des reserves internationales"
    ER              "Taux de change de fin de periode (Annee t)"
    RES             "Stock de reserves internationales (Avoirs exterieurs nets)"

*** --- Secteur public (Administration centrale) ---
    AMORTG          "Amortissement de la dette publique"
    BRG             "Besoin de financement de l'Administration centrale"
    D_BG            "Emprunt de l'Administration centrale aupres du secteur prive"
    D_DCG           "Variation des credits bancaires a l'Etat"
    D_NFDG_PRG      "Financement exterieur net - Prets programmes"
    D_NFDG_PRJ      "Financement exterieur net - Prets projets"
    DCG             "Credits bancaires a l'Etat (Stock)"
    DEBTG           "(Stock de la) dette publique totale"
    DEFG            "Deficit budgetaire"
    D_NFDG          "Financement exterieur net total de l'administration centrale"
    DINVG           "Investissement public sur financement interieur"
    FINVG           "Investissement public sur financement exterieur"
    INVG            "Investissement public total (Depenses en capital)"
    KTRAG           "Transferts de capital recus par l'Etat (Dons en capital)"
    NFDG            "(Stock de la) dette publique exterieure"
    NDDG            "(Stock de la) dette publique interieure"
    TOTG            "Depenses publiques totales"

*** --- Secteur prive ---
    INVP            "Investissement du secteur prive"
    SP              "Epargne du secteur prive"
    D_DCP           "Variation des credits bancaires au secteur prive"
    DCP             "Credits bancaires au secteur prive (Stock)"
    D_NFDP          "Financement exterieur net du secteur prive"
    OTHKTRA         "Transferts de capital recus par le secteur prive"

*** --- Investissements Directs etrangers (IDE) ---
    FDI_NET         "Flux nets d'Investissements Directs Etrangers (IDE)"
    FDI_IN          "Entrees brutes d'IDE (Flux entrants)"
    FDI_OUT         "Sorties brutes d'IDE (Flux sortants)"


*** --- VERIFICATION DE LA LOI DE WALRAS DU BLOC FINANCIER---
    LEONF           "Equilibre du marche financier du secteur prive"
     
;

* --- LISTE DES EQUATIONS ---

EQUATIONS
** --- BLOC PRODUCTION ---
    EQ1(j)          "Valeur ajoutee dans la branche j (Leontief)"
    EQ2(j)          "Consommation intermediaire totale de la branche j (Leontief)"
    EQ3(tr)         "Cobb-Douglas entre le travail et le capital"
    EQ4(ntr)        "Valeur ajoutee de la branche ntr"
    EQ5(ntr)        "Valeur ajoutee de la branche pub (nominale)"
    EQ6(trj)        "Demande de travail de la branche trj"
    EQ7(trj)        "Demande de capital de la branche trj"
    EQ8(tr,j)       "Consommation intermediaire par produit (Leontief)"
    EQ9(tr,trj)     "Repartition de la production domestique de la branche j"
 
** --- BLOC MENAGE ---
    EQ10(h)         "Revenu du menage h"
    EQ11(h)         "Revenu salarial du menage h"
    EQ12(h)         "Revenu du capital du menage h"
    EQ13(h)         "Revenu du transfert du menage h"
    EQ14(h)         "Revenu disponible du menage h"
    EQ15(h)         "Epargne du menage h"
    EQ16(h)         "Recettes non fiscales versees par le menage h"
    EQ17(h)         "Depenses de consommation du menage h"

** --- BLOC SOCIETE ---
    EQ18            "Revenu des entreprises"
    EQ19            "Revenu du capital des entreprises"
    EQ20            "Revenu du transfert des entreprises"
    EQ21            "Revenu disponible des entreprises"
    EQ22            "Epargne des entreprises"
    
** --- BLOC ADMINISTRATION CENTRALE ---
    EQ23            "Revenu total de l'Administration centrale"
    EQ24            "Revenu fiscal de l'Administration centrale"
    EQ25            "Revenu non fiscal de l'Administration centrale"
    EQ26            "Revenu des transferts de l'Administration centrale"
    EQ27            "Epargne de l'Administration centrale"
    EQ28            "Recettes provenant des taxes directes sur le revenu des entreprises"
    EQ29(h)         "Recettes provenant des taxes directes sur le revenu du menage h"
    EQ30(bns)       "Recettes provenant des taxes indirectes sur le produit bns"
    EQ31            "Recettes provenant des taxes indirectes sur le service ser"
    EQ32            "Recettes provenant des autres taxes indirectes (Societes)"
    EQ33(tr)        "Recettes provenant des tarifs douaniers sur le produit tr"
    EQ34            "Recettes provenant des autres tarifs douaniers (Societes)"
    EQ35            "Recettes non fiscales provenant des Societes"
    EQ36            "Recettes non fiscales provenant des menages"

** --- BLOC AUTRES APU ET ISBLSM ---
    EQ37            "Revenu des autres APU et des ISBLSM"
    EQ38            "Recettes non fiscales des autres APU et des ISBLSM provenant des menages"
    EQ39            "Epargne des autres APU et des ISBLSM"
    EQ40            "Budget de consommation finale des autres APU et des ISBLSM"

** --- BLOC RESTE DU MONDE ---
    EQ41            "Revenu total du Reste du Monde"
    EQ42            "Revenu salarial du Reste du Monde"
    EQ43            "Revenu du capital du Reste du Monde"
    EQ44            "Epargne du Reste du monde"
    EQ45            "Balance courante"

** --- BLOC TRANSFERTS ---
    EQ46(agd)       "Transferts du RDM aux agents domestiques"
    EQ47(agngvt)    "Transferts de l'Administration centrale aux autres agents"
    EQ48(h)         "Transferts des societes au menage h"
    EQ49(h)         "Transferts des autres APU et des ISBLSM au menage h"
    EQ50            "Transferts des societes aux autres APU et aux ISBLSM"
    
** --- BLOC DEMANDES ---
    EQ51            "Consommation finale de l'Administration centrale"
    EQ52            "Consommation finale des autres APU et des ISBLSM"
    EQ53(tr,h)      "Consommation du menage h en produit tr"
    EQ54            "Formation Brute de Capitale Fixe"
    EQ55(tr)        "Demande en produit tr pour fins d'investissement"
    EQ56(tr)        "Demande intermediaire en produit tr"
    EQ57            "Demande interieur de produits petroliers"
    EQ58(bns)       "Marge de commercialisation du produit bns"
    EQ59(bns)       "Marge de transport du produit bns"
 
** --- BLOC COMMERCE INTERNATIONAL ---
    EQ60(trj)       "CET entre exportations et ventes sur le marche interieur"
    EQ61(trj)       "Offre relative derivee de la CET (EX et DS)"
    EQ62            "Exportations de produits petroliers"
    EQ63(trj)       "CES entre importations et achats sur le marche interieur"
    EQ64(trj)       "Demande relative derivee de la CES (IM et DD)"
    EQ65            "Importations de produits petroliers"

** --- BLOC PRIX ---
    EQ66(j)         "Prix au producteur et Prix de la valeur ajoutee de la branche j"
    EQ67(j)         "Indice de prix des consommations intermedaires de la branche j"
    EQ68(tr)        "Prix interieurs du produit tr incluant les taxes indirectes (hors marges)"
    EQ69(bns)       "Prix interieurs du produit bns incluant les taxes indirectes (marges comprises)"
    EQ70            "Prix interieurs du service ser incluant les taxes indirectes (hors marges)"
    EQ71(tr)        "Prix des produits importes tr (incluant taxes - hors marges)"
    EQ72(bns)       "Prix des produits importes bns (incluant taxes - marges comprises)"
    EQ73            "Prix des services importes (incluant taxes - hors marges)"
    EQ74(tr)        "Prix du produit composite bns (incluant marges)"
    EQ75(tr)        "Prix a l'exportations"
    EQ76(trj)       "Prix au producteur (ligne)"
    EQ77            "Indice de prix (deflateur du PIB)"
    EQ78            "Indice des prix a la consommation"
    EQ79            "Indice des prix a l investissement"

** --- BLOC EQUILIBRE ---
    EQ80(npbns)     "Absorption domestique"
    EQ81            "Equilibre sur le marche des produits petroliers"
    EQ82            "Production de service publique"
    EQ83            "Production d'autres services non marchands"
    EQ84(tr)        "Equilibre sur le marche interieur"
    EQ85            "Equilibre sur le marche du travail"
    EQ86(trj)       "Equilibre sur le marche du capital"
    EQ87            "Equilibre epargne-investissement"

** --- BLOC PRODUIT INTERIEUR BRUT ---
    EQ88            "PIB au prix de base"
    EQ89            "PIB au prix du marche"
    EQ90            "PIB approche revenu"
    EQ91            "PIB approche demande finale"

** --- BLOC AUTRES VALEURS REELLES ---
    EQ92(h)         "Budget de consommation du menage h"
    EQ93            "PIB reel au prix de base"
    EQ94            "PIB reel au prix du marche"
    EQ95            "Formation brute de capitale fixe"

** --- LOI DE WALRAS ---
    WALRAS          "Verification de la loi de Walras"
    

** --- BLOC FINANCIER ---
    EQ_FIN01        "Depenses publiques totales"
    EQ_FIN02        "Besoin de financement de l'Administration Centrale"
    EQ_FIN03        "Deficit budgetaire"
    EQ_FIN04        "Depenses totales d'investissement public"
    EQ_FIN05        "Depenses en capital sur financement exterieur"
    EQ_FIN06        "Financement exterieur net total de l'Administration Centrale"
    EQ_FIN07        "Total du financement du deficit de l'Administration Centrale"
    EQ_FIN08        "Epargne totale du secteur prive"
    EQ_FIN09        "Emprunt de l'Administration Centrale aupres du secteur prive (Credit non bancaire)"
    EQ_FIN10        "Demande de monnaie (Equation quantitative de la monnaie)"
    EQ_FIN11        "Equilibre du marche monetaire (Offre = Demande)"
    EQ_FIN12        "Variation de l'offre de monnaie (Contreparties de la masse monetaire)"
    EQ_FIN13        "Variation du taux de change de fin de periode"
    EQ_FIN14        "Variation de la demande de monnaie par rapport au stock initial"
    EQ_FIN15        "Variation de l'offre de monnaie par rapport au stock initial"
    EQ_FIN16        "(Stock du) credit bancaire a l'Etat"
    EQ_FIN17        "(Stock du) credit bancaire au secteur prive"
    EQ_FIN18        "(Stock des) reserves internationales"
    EQ_FIN19        "Variation des reserves (= balance globale de la BOP)"
    EQ_FIN20        "Investissement direct etranger net (Flux entrants - Flux sortants)"
    EQ_FIN21        "Depenses totales d'investissement prive"
    EQ_FIN22        "Credit bancaire au secteur prive"
    EQ_FIN23        "Dette publique exterieure"
    EQ_FIN24        "Dette publique interieure"
    EQ_FIN25        "Dette publique exterieure (calculee a partir du ratio en pourcentage des exportations)"
    EQ_FIN26        "Dette publique totale"
 
** Loi de Walras
    WALRASF         "Loi de Walras (Bloc financier)"
    
;

* --- SPECIFICATION DES EQUATIONS ---

** --- BLOC PRODUCTION ---
 EQ1(j)..       VA(j)                   =e= v(j)*XS(j);

 EQ2(j)..       CI(j)                   =e= io(j)*XS(j);

 EQ3(trj)..     VA(trj)                 =e= A(trj)*LD(trj)**alpha(trj)*KD(trj)**(1 - alpha(trj)) ;

 EQ4(ntr)..     VA(ntr)                 =e= LD(ntr);

 EQ5(ntr)..     VA(ntr)*PVA(ntr)        =e= W*LD(ntr);

 EQ6(trj)..     W*LD(trj)               =e= alpha(trj)*PVA(trj)*VA(trj);

 EQ7(trj)..     R(trj)*KD(trj)          =e= {1 - alpha(trj)}*PVA(trj)*VA(trj);

 EQ8(tr,j)..    DI(tr,j)                =e= aij(tr,j)*CI(j);

 EQ9(tr,trj)..  DS(tr,trj)              =e= theta(tr,trj)*DX(trj);
 
                          
** --- BLOC MENAGES ---
 EQ10(h)..      YH(h)                   =e= YHL(h) + YHK(h) + YHTRA(h);

 EQ11(h)..      YHL(h)                  =e= phi(h)*{e*W_R*LD_R + SUM[j, W*LD(j)]};

 EQ12(h)..      YHK(h)                  =e= lambda(h)*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ13(h)..      YHTRA(h)                =e= TRA(h,'firm') + TRA(h,'gvt') + TRA(h,'ngo') + e*TRA(h,'row');

 EQ14(h)..      YDH(h)                  =e= YH(h) - TDH(h);

 EQ15(h)..      SH(h)                   =e= psi(h)*YDH(h);

 EQ16(h)..      NTXH(h)                 =e= ntyh(h)*YDH(h);

 EQ17(h)..      CTH(h)                  =e= YDH(h) - SH(h) - NTXH(h);
 

** --- BLOC SOCIETES ---
 EQ18..         YF                      =e= YFK + YFTRA;

 EQ19..         YFK                     =e= {1 - lambda_R - SUM[h, lambda(h)]}*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ20..         YFTRA                   =e= TRA('firm','gvt') + e*TRA('firm','row') ;

 EQ21..         YDF                     =e= YF - TDF - TIF - TIMF;

 EQ22..         SF                      =e= YDF - NTXF - TRA('ngo','firm') - sum[h, TRA(h,'firm')];
 

** --- BLOC GOUVERNEMENT ---
 EQ23..         YG                      =e= YGTX + YGNTX + YGTRA;
 
 EQ24..         YGTX                    =e= SUM[tr, TI(tr)] + TIF + SUM[tr, TIM(tr)] + TIMF + TDF + SUM[h, TDH(h)];

 EQ25..         YGNTX                   =e= NTXF + NTXHH('gvt');

 EQ26..         YGTRA                   =e= e*TRA('gvt','row');                       
                                     
 EQ27..         SG                      =e= YG - CTG - {SUM[agngvt$(not sameas(agngvt, 'row')), TRA(agngvt, 'gvt')] + e*TRA('row', 'gvt')};

 EQ28..         TDF                     =e= tyf*YF;

 EQ29(h)..      TDH(h)                  =e= tyh(h)*YH(h);

 EQ30(bns)..    TI(bns)                 =e= tx(bns)*{
                                                [PL(bns) + {tmgc(bns) + tmgt(bns)}*PC('ser')]*DD(bns)
                                                    + [{1 + tm(bns)}*e*PWM(bns) + {tmgc(bns) + tmgt(bns)}*PC('ser')]*IM(bns)
                                            };
                                          
 EQ31..         TI('ser')               =e= tx('ser')*{PL('ser')*DD('ser') + [1 + tm('ser')]*e*PWM('ser')*IM('ser')};

 EQ32..         TIF                     =e= syfi*YF;

 EQ33(tr)..     TIM(tr)                 =e= tm(tr)*e*PWM(tr)*IM(tr);

 EQ34..         TIMF                    =e= syfm*YF;

 EQ35..         NTXF                    =e= ntyf*YDF;
 
 EQ36..         NTXHH('gvt')            =e= sntx('gvt')*SUM[h, NTXH(h)];
 
 
** --- BLOC AUTRES APU ET ISBLSM ---
 EQ37..         YNGO                    =e= TRA('ngo','firm') + TRA('ngo','gvt') + e*TRA('ngo','row') + NTXHH('ngo');
 
 EQ38..         NTXHH('ngo')            =e= sntx('ngo')*SUM[h, NTXH(h)];

 EQ39..         SNGO                    =e= YNGO - SUM[h, TRA(h,'ngo')]  - CTNGO;

 EQ40..         CTNGO                   =e= mu_CTNGO/(1 - mu_CTNGO)*{CTG + SUM[h, CTH(h)]};


** --- BLOC RESTE DU MONDE ---
 EQ41..         YROW                    =e= YROWL + YROWK + SUM[tr, PWM(tr)*IM(tr)] + TRA('row','gvt');

 EQ42..         e*YROWL                 =e= {1 - SUM[h, phi(h)]}*{e*W_R*LD_R + SUM[j, W*LD(j)]};

 EQ43..         e*YROWK                 =e= lambda_R*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ44..         SROW                    =e= YROW - SUM[tr, PWE(tr)*EX(tr)]
                                            - W_R*LD_R - R_R*KD_R
                                            - SUM[agd, TRA(agd,'row')];

 EQ45..         CAB                     =e= -SROW;
 
 

** --- BLOC TRANSFERTS ---
 EQ46(agd)..    TRA(agd,'row')          =e= PIXCON**eta*TRAO(agd,'row');
 
 EQ47(agngvt).. TRA(agngvt,'gvt')       =e= PIXCON**eta*TRAO(agngvt,'gvt');

 EQ48(h)..      TRA(h,'firm')           =e= lambda_TRA(h,'firm')*YDF;

 EQ49(h)..      TRA(h,'ngo')            =e= PIXCON**eta*TRAO(h,'ngo');

 EQ50..         TRA('ngo','firm')       =e= lambda_TRA('ngo','firm')*YDF;


** --- BLOC DEMANDE ---
 EQ51..         P('pub')*CG             =e= CTG;
 
 EQ52..         P('othntr')*CNGO        =e= CTNGO;

 EQ53(tr,h)..   PC(tr)*CH(tr,h)         =e= gamma_CH(tr,h)*CTH(h);

 EQ54..         FBCF                    =e= IT - SUM[bns, PC(bns)*VSTK(bns)];

 EQ55(tr)..     INV(tr)*PC(tr)          =e= gamma_INV(tr)*FBCF;

 EQ56(tr)..     DIT(tr)                 =e= SUM[j, DI(tr,j)];
 
 EQ57..         mu_D*Q('petr')          =e= SUM[h, CH('petr', h)] + DIT('petr') + INV('petr');

 EQ58(bns)..    MRGCOM(bns)             =e= tmgc(bns)*{DD(bns) + IM(bns)};

 EQ59(bns)..    MRGTRP(bns)             =e= tmgt(bns)*{DD(bns) + IM(bns)};
 

** --- BLOC COMMERCE INTERNATIONAL ---
 EQ60(trj)..    XS(trj)                 =e= A_E(trj)*{beta_E(trj)*EX(trj)**rho_E(trj)
                                            + [1 - beta_E(trj)]*DX(trj)**rho_E(trj)}**[1/rho_E(trj)];

 EQ61(trj)..    EX(trj)                 =e= {PE(trj)/(SUM[tr, theta(tr,trj)*PL(tr)])*[1 - beta_E(trj)]/beta_E(trj)}
                                            **sigma_E(trj)*DX(trj);
                                            
 EQ62..         EX('petr')              =e= mu_E*Q('petr');                                            
                                                                                                                     
 EQ63(trj)..    Q(trj)                  =e= A_M(trj)*{beta_M(trj)*IM(trj)**(-rho_M(trj))
                                            + [1 - beta_M(trj)]*DD(trj)**(-rho_M(trj))}**[-1/rho_M(trj)];
                                      
 EQ64(trj)..    IM(trj)                 =e= {PD(trj)/PM(trj)*beta_M(trj)/[1 - beta_M(trj)]}**sigma_M(trj)*DD(trj);
 
 EQ65..         IM('petr')              =e= Q('petr') ;


** --- BLOC PRIX ---
 EQ66(j)..      P(j)*XS(j)              =e= PVA(j)*VA(j) + PCI(j)*CI(j);

 EQ67(j)..      PCI(j)*CI(j)            =e= SUM[tr, PC(tr)*DI(tr,j)];

 EQ68(tr)..     PPD(tr)                 =e= {1 + tx(tr)}*PL(tr);

 EQ69(bns)..    PD(bns)                 =e= PPD(bns) +  {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PC('ser');

 EQ70..         PD('ser')               =e= PPD('ser');

 EQ71(tr)..     PPM(tr)                 =e= {1 + tx(tr)}*{1 + tm(tr)}*e*PWM(tr);

 EQ72(bns)..    PM(bns)                 =e= PPM(bns) + {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PC('ser');

 EQ73..         PM('ser')               =e= PPM('ser');

 EQ74(tr)..     PC(tr)*Q(tr)            =e= PD(tr)*DD(tr) + PM(tr)*IM(tr);

 EQ75(tr)..     PE(tr)                  =e= e*PWE(tr);

 EQ76(trj)..    P(trj)*XS(trj)          =e= SUM[tr, PL(tr)*DS(tr,trj)] + PE(trj)*EX(trj);

 EQ77..         PIXPIB                  =e= SUM[j, PVA(j)*VAO(j)]/
                                            SUM[j, PVAO(j)*VAO(j)];

 EQ78..         PIXCON                  =e= SUM[tr, PC(tr)*SUM[h, CHO(tr,h)]]/
                                            SUM[tr, PCO(tr)*SUM[h, CHO(tr,h)]]; 

 EQ79..         PIXINV                  =e= PROD[tr, (PC(tr)/PCO(tr))**gamma_INV(tr)];
 

** --- BLOC EQUILIBRE ---
 EQ80(npbns)..  Q(npbns)                =e= SUM[h, CH(npbns,h)]  + DIT(npbns)  + INV(npbns)  + VSTK(npbns) ;

 EQ81..         PC('petr')*Q('petr')    =e= PC('petr')*{SUM[h, CH('petr',h)] + DIT('petr') + INV('petr') + VSTK('petr')} + PE('petr')*EX('petr');
 
 EQ82..         XS('pub')               =e= CG;

 EQ83..         XS('othntr')            =e= CNGO;

 EQ84(tr)..     SUM[trj, DS(tr,trj)]    =e= DD(tr);

 EQ85..         LS                      =e= LD_R + SUM[j, LD(j)];
 
 EQ86(trj)..    KS(trj)                 =e= KD(trj);

 EQ87..         IT                      =e= SUM[h, SH(h)] + SF + SG + SNGO + e*SROW;
 

** --- BLOC PRODUIT INTERIEUR BRUT ---
 EQ88..         PIB_BP                  =e= SUM[j, PVA(j)*VA(j)];

 EQ89..         PIB_MP                  =e= PIB_BP + SUM[tr, TIM(tr) + TI(tr)];

 EQ90..         PIB_IB                  =e= SUM[j, W*LD(j)] + SUM[trj, R(trj)*KD(trj)]
                                            + SUM[tr, TIM(tr) + TI(tr)];

 EQ91..         PIB_FD                  =e= SUM[tr, SUM[h, PC(tr)*CH(tr,h)]]
                                            + CTG + CTNGO
                                            + SUM[bns, PC(bns)*{INV(bns) + VSTK(bns)}] + PC('ser')*INV('ser')
                                            + e*SUM[tr, PWE(tr)*EX(tr)]
                                            - e*SUM[tr, PWM(tr)*IM(tr)];

** --- BLOC AUTRE VAEURS REELLES ---
 EQ92(h)..      CTH_reel(h)             =e= CTH(h)/PIXCON;

 EQ93..         PIB_BP_reel             =e= PIB_BP/PIXPIB;

 EQ94..         PIB_MP_reel             =e= PIB_MP/PIXCON;

 EQ95..         FBCF_reel               =e= FBCF/PIXINV;

** --- LOI DE WALRAS ---
 WALRAS..       LEON                    =e= Q('ser') - SUM[h, CH('ser',h)]  - DIT('ser')
                                            - SUM[bns, MRGCOM(bns)] - SUM[bns, MRGTRP(bns)]
                                            - INV('ser');

** --- BLOC FINANCIER ---
 EQ_FIN01..     TOTG                    =e= CTG + SUM[agngvt$(not sameas(agngvt, 'row')), TRA(agngvt, 'gvt')]
                                            + e*TRA('row', 'gvt') + INVG;
 
 EQ_FIN02..     BRG                     =e= INVG - SG;
 
 EQ_FIN03..     DEFG                    =e= -BRG;

 EQ_FIN04..     INVG                    =e= DINVG + E*FINVG;

 EQ_FIN05..     FINVG                   =e= KTRAG + D_NFDG_PRJ;

 EQ_FIN06..     D_NFDG                  =e= D_NFDG_PRJ + D_NFDG_PRG - AMORTG;

 EQ_FIN07..     BRG                     =e= E*KTRAG + E*D_NFDG + D_DCG + D_BG;

 EQ_FIN08..     SP                      =e= SUM[h, SH(h)] + SF + SNGO;

 EQ_FIN09..     D_BG                    =e= psi_BG*SP;

 EQ_FIN10..     MD                      =e= (1/vel)*PIB_MP;
 
 EQ_FIN11..     MS                      =e= MD;

 EQ_FIN12..     D_MS                    =e= ER*D_RES + D_DCG + D_DCP + RESOO*D_ER;

 EQ_FIN13..     D_ER                    =e= ER - EROO;
 
 EQ_FIN14..     MD                      =e= MDOO + D_MD;

 EQ_FIN15..     MS                      =e= MSOO + D_MS;
 
 EQ_FIN16..     DCG                     =e= DCGOO + D_DCG;
 
 EQ_FIN17..     DCP                     =e= DCPOO + D_DCP;
 
 EQ_FIN18..     RES                     =e= RESOO + D_RES;

 EQ_FIN19..     D_RES                   =e= CAB + KTRAG + OTHKTRA + FDI_NET + D_NFDG + D_NFDP;

 EQ_FIN20..     FDI_NET                 =e= FDI_IN - FDI_OUT;

 EQ_FIN21..     INVP                    =e= IT - INVG;

 EQ_FIN22..     D_DCP                   =e= psi_DCP*INVP;
 
 EQ_FIN23..     NFDG                    =e= NFDGOO + D_NFDG; 

 EQ_FIN24..     NDDG                    =e= NDDGOO + D_DCG + D_BG;

 EQ_FIN25..     NFDG                    =e= psi_EX*SUM[tr, PWE(tr)*EX(tr)];
  
 EQ_FIN26..     DEBTG                   =e= ER*NFDG + NDDG;
 
 WALRASF..      LEONF                   =e= D_DCP + E*D_NFDP  + E*FDI_NET + E*OTHKTRA
                                            + RESOO*D_ER + (ER - E)*D_RES + SP
                                            - D_MD - D_BG - INVP;


* --- INITIALISATION DES VARIABLES ---
** --- VOLUMES ---
 CG.L           = CGO;
 CH.L(tr,h)     = CHO(tr,h);
 CI.L(j)        = CIO(j);
 CNGO.L         = CNGOO;
 CTH_reel.L(h)  = CTH_reelO(h);
 DD.L(tr)       = DDO(tr);
 DI.L(tr,j)     = DIO(tr,j);
 DIT.L(tr)      = DITO(tr);
 DS.L(tr,trj)   = DSO(tr,trj);
 DX.L(trj)      = DXO(trj);
 EX.L(tr)       = EXO(tr);
 FBCF_reel.L    = FBCF_reelO;
 IM.L(tr)       = IMO(tr);
 INV.L(tr)      = INVO(tr);
 KD.L(trj)      = KDO(trj);
 KD_R.L         = KD_RO;
 KS.L(trj)      = KSO(trj);
 LD.L(j)        = LDO(j);
 LD_R.L         = LD_RO; 
 LS.L           = LSO;
 MRGCOM.L(bns)  = MRGCOMO(bns);
 MRGTRP.L(bns)  = MRGTRPO(bns);
 PIB_MP_reel.L  = PIB_MP_reelO;
 PIB_BP_reel.L  = PIB_BP_reelO;
 Q.L(tr)        = QO(tr);
 VA.L(j)        = VAO(j);
 VSTK.L(bns)    = VSTKO(bns);
 XS.L(j)        = XSO(j); 

** --- VALEURS NOMINALES ---
 CAB.L          = CABO;
 CTG.L          = CTGO;
 CTNGO.L        = CTNGOO;
 CTH.L(h)       = CTHO(h);
 FBCF.L         = FBCFO;
 IT.L           = ITO;
 NTXF.L         = NTXFO;
 NTXH.L(h)      = NTXHO(h);
 NTXHH.L(agntr) = NTXHHO(agntr);
 PIB_FD.L       = PIB_FDO;
 PIB_IB.L       = PIB_IBO;
 PIB_MP.L       = PIB_MPO;
 SF.L           = SFO;
 SG.L           = SGO;
 SH.L(h)        = SHO(h);
 SNGO.L         = SNGOO;
 SROW.L         = SROWO;
 TDF.L          = TDFO;
 TDH.L(h)       = TDHO(h);
 TIF.L          = TIFO;
 TIMF.L         = TIMFO;
 TIM.L(tr)      = TIMO(tr);
 TI.L(tr)       = TIO(tr);
 TRA.L(ag,agj)  = TRAO(ag,agj);
 YDH.L(h)       = YDHO(h);
 YDF.L          = YDFO;
 YFK.L          = YFKO;
 YF.L           = YFO;
 YFTRA.L        = YFTRAO;
 YG.L           = YGO;
 YGTRA.L        = YGTRAO;
 YGTX.L         = YGTXO;
 YGNTX.L        = YGNTXO;
 YHK.L(h)       = YHKO(h);
 YHL.L(h)       = YHLO(h);
 YH.L(h)        = YHO(h);
 YHTRA.L(h)     = YHTRAO(h);
 YNGO.L         = YNGOO;
 YROWK.L        = YROWKO;
 YROWL.L        = YROWLO;
 YROW.L         = YROWO;

** --- PRIX ---
 e.L            = eO;
 PC.L(tr)       = PCO(tr);
 PCI.L(j)       = PCIO(j);
 PD.L(tr)       = PDO(tr);
 PE.L(tr)       = PEO(tr);
 PIXCON.L       = PIXCONO;
 PIXPIB.L       = PIXPIBO;
 PIXINV.L       = PIXINVO;
 PL.L(tr)       = PLO(tr);
 PM.L(tr)       = PMO(tr);
 P.L(j)         = PO(j);
 PPD.L(tr)      = PPDO(tr);
 PPM.L(tr)      = PPMO(tr);
 PVA.L(j)       = PVAO(j);
 PWE.L(tr)      = PWEO(tr);
 PWM.L(tr)      = PWMO(tr);
 R.L(trj)       = RO(trj);
 R_R.L          = R_RO;
 W.L            = WO;
 W_R.L          = W_RO;

** --- WALRAS ---
 LEON.L         = 0;


** BLOC FINANCIER
 AMORTG.L       = AMORTGO; 
 BRG.L          = BRGO;
 D_BG.L         = D_BGO;
 D_DCG.L        = D_DCGO;
 D_DCP.L        = D_DCPO;
 D_ER.L         = D_ERO;
 D_MD.L         = D_MDO;
 D_MS.L         = D_MSO;
 D_NFDG.L       = D_NFDGO;
 D_NFDG_PRG.L   = D_NFDG_PRGO;
 D_NFDG_PRJ.L   = D_NFDG_PRJO;
 D_NFDP.L       = D_NFDPO;
 D_RES.L        = D_RESO;
 DEBTG.L        = DEBTGO;
 DEFG.L         = DEFGO;
 DINVG.L        = DINVGO;
 ER.L           = ERO;
 FDI_IN.L       = FDI_INO;
 FDI_NET.L      = FDI_NETO;
 FDI_OUT.L      = FDI_OUTO;
 FINVG.L        = FINVGO;
 INVG.L         = INVGO;
 INVP.L         = INVPO;
 KTRAG.L        = KTRAGO;
 MD.L           = MDO;
 MS.L           = MSO;
 NDDG.L         = NDDGO;
 NFDG.L         = NFDGO;
 OTHKTRA.L      = OTHKTRAO;
 RES.L          = RESO;
 SP.L           = SPO;
 TOTG.L         = TOTGO;

 
** --- WALRAS (BLOC FINANCIER) ---
 LEONF.L        = 0;

 
* --- FERMETURE DU MODELE ---
** Le deficict des autres APU et des ISBLSM est exogene
 SNGO.fx        = SNGOO;

** La balance courante est exogene
 CAB.fx         = CABO;

** Le taux de change nominal est le numeraire
 e.fx           = eO;

** Les depenses courantes de l'Administration centrale sont exogenes
 CTG.fx         = CTGO;

** Le capital est fixe par branche
 KS.fx(trj)     = KSO(trj);
 KD_R.fx        = KD_RO;
 
** L'offre totale de travail est fixe
 LS.fx          = LSO;
 
** Les prix mondiaux sont exogenes
 PWE.fx(tr)     = PWEO(tr);
 PWM.fx(trj)    = PWMO(trj);
 PWM.fx('petr') = PWMO('petr');

 R_R.fx         = R_RO;
 W_R.fx         = W_RO; 

** Les variations de stocks des biens non petroliers sont exogenes
 VSTK.fx('agr')     = VSTKO('agr');
 VSTK.fx('food')    = VSTKO('food');
 VSTK.fx('othind')  = VSTKO('othind');

** Le prix interne des produits petroliers est fixe
 PL.fx('petr')  = PLO('petr');

** Autres assignations (les zeros structurels sont fixes) ---
 INV.fx(tr)     $(gamma_INV(tr) eq 0)   = 0;
 DS.fx(tr,trj)  $(theta(tr,trj) eq 0)   = 0;
 CH.fx(tr,h)    $(gamma_CH(tr,h) eq 0)  = 0;
 DI.fx(tr,j)    $(aij(tr,j) eq 0)       = 0;
 TRA.fx(ag,agj) $(TRAO(ag,agj) eq 0)    = 0;

** Fixation des variables financieres
 DINVG.fx        = DINVGO;
 KTRAG.fx        = KTRAGO;
 AMORTG.fx       = AMORTGO;
 OTHKTRA.fx      = OTHKTRAO;
 D_NFDG_PRG.fx   = D_NFDG_PRGO;
 ER.fx           = E.L/(1 + g_ER);
 FDI_IN.fx       = FDI_INO;
 FDI_OUT.fx      = FDI_OUTO;


* --- EXECUTION DU MODELE ---

MODEL EXTER Economie ouverte avec gouvernement /ALL/;
EXTER.HOLDFIXED = 1;

OPTION SOLPRINT = ON;
OPTION LIMROW   = 100;
OPTION LIMCOL   = 100;

SOLVE EXTER USING CNS;


* =============================================================================
* --- AFFICHAGE DES VALEURS INITIALES (PARAMÈTRES O) ET NIVEAUX (.L) ---
* =============================================================================

* --- 1. VOLUMES ---
DISPLAY 
    CGO, CG.L, CHO, CH.L, CIO, CI.L, CNGOO, CNGO.L, CTH_reelO, CTH_reel.L,
    DDO, DD.L, DIO, DI.L, DITO, DIT.L, DSO, DS.L, DXO, DX.L,
    EXO, EX.L,
    FBCF_reelO, FBCF_reel.L,
    IMO, IM.L, INVO, INV.L,
    KD_RO, KD_R.L, KDO, KD.L, KSO, KS.L,
    LD_RO, LD_R.L, LDO, LD.L, LSO, LS.L,     
    MRGCOMO, MRGCOM.L, MRGTRPO, MRGTRP.L,
    PIB_MP_reelO, PIB_MP_reel.L, PIB_BP_reelO, PIB_BP_reel.L,
    QO, Q.L,
    VAO, VA.L, VSTKO, VSTK.L,
    XSO, XS.L
    ;

* --- 2. VALEURS NOMINALES ---
DISPLAY 
    CABO, CAB.L, CTGO, CTG.L, CTHO, CTH.L, CTNGOO, CTNGO.L,
    FBCFO, FBCF.L,
    ITO, IT.L, 
    PIB_FDO, PIB_FD.L, PIB_IBO, PIB_IB.L, PIB_MPO, PIB_MP.L,
    SFO, SF.L, SGO, SG.L, SHO, SH.L, SNGOO, SNGO.L, SROWO, SROW.L,
    TDFO, TDF.L, TDHO, TDH.L, TIFO, TIF.L, TIMFO, TIMF.L, TIMO, TIM.L, TIO, TI.L, TRAO, TRA.L,
    YDHO, YDH.L, YDFO, YDF.L,YFKO, YFK.L, YFO, YF.L, YFTRAO, YFTRA.L,
    YGO, YG.L, YGTRAO, YGTRA.L, YGTXO, YGTX.L, YHKO, YHK.L, YHLO, YHL.L, YHO, YH.L, YHTRAO, YHTRA.L, 
    YNGOO, YNGO.L, YROWKO, YROWK.L, YROWLO, YROWL.L, YROWO, YROW.L
    ;

* --- 3. PRIX ---
DISPLAY 
    eO, e.L,
    PCO, PC.L, PCIO, PCI.L, PDO, PD.L, PEO, PE.L, 
    PIXCONO, PIXCON.L, PIXPIBO, PIXPIB.L, PIXINVO, PIXINV.L,
    PLO, PL.L, PMO, PM.L, PO, P.L, PPDO, PPD.L, PPMO, PPM.L, PVAO, PVA.L,
    PWEO, PWE.L, PWMO, PWM.L,
    RO, R.L, R_RO, R_R.L,
    WO, W.L, W_RO, W_R.L
    ;

* --- 4. BLOC FINANCIER ---    
display
    AMORTGO, AMORTG.L,
    BRGO, BRG.L,
    D_BGO, D_BG.L,
    D_DCGO, D_DCG.L, D_DCPO, D_DCP.L,
    D_ERO, D_ER.L,
    D_MDO, D_MD.L, D_MSO, D_MS.L, 
    D_NFDGO, D_NFDG.L, D_NFDG_PRJO, D_NFDG_PRJ.L, D_NFDG_PRGO, D_NFDG_PRG.L,
    D_NFDPO, D_NFDP.L, D_RESO, D_RES.L, 
    DCGOO, DCGO, DCG.L, DCPOO, DCPO, DCP.L,
    DEBTGOO, DEBTGO, DEBTG.L,
    DEFGO, DEFG.L,
    DINVGO, DINVG.L,
    ERO, ER.L,
    FDI_NETO, FDI_NET.L, FDI_INO, FDI_IN.L, FDI_OUTO, FDI_OUT.L, FINVGO, FINVG.L,
    INVGO, INVG.L, 
    INVPO, INVP.L,
    KTRAGO, KTRAG.L, 
    MDO, MD.L,
    NDDGOO, NDDGO, NDDG.L, NFDGOO, NFDGO, NFDG.L,
    OTHKTRAO, OTHKTRA.L,
    RESOO, RESO, RES.L,
    SPO, SP.L,
    TOTGO, TOTG.L
    ;

* --- CALCUL DES INDICATEURS ---     
 DEFG_PIB('sim')    = DEFG.L/PIB_MP.L*100;
 YGTX_PIB('sim')    = YGTX.L/PIB_MP.L*100;
 DEBTG_PIB('sim')   = DEBTG.L/PIB_MP.L*100;
 growth_PIB('sim')  = (PIB_MP_reel.L/PIB_MP_reelO - 1)*100;
 mu_RES('sim')      = RES.L/(SUM[tr, PWM.L(tr)*IM.L(tr)]/12);
 TOTG_PIB('sim')    = TOTG.L/PIB_MP.L*100;
 
 DEFG_PIB('var')    = DEFG_PIB('sim')   - DEFG_PIB('base');
 YGTX_PIB('var')    = YGTX_PIB('sim')   - YGTX_PIB('base');
 DEBTG_PIB('var')   = DEBTG_PIB('sim')  - DEBTG_PIB('base');
 growth_PIB('var')  = growth_PIB('sim') - growth_PIB('base');
 mu_RES('var')      = mu_RES('sim')     - mu_RES('base');
 TOTG_PIB('var')    = TOTG_PIB('sim')   - TOTG_PIB('base');

display
    DEFG_PIB, DEBTG_PIB,
    TOTG_PIB, growth_PIB,
    mu_RES,
    YGTX_PIB
   ;
  
$include "..\src\resultats.gms"