$TITLE    MODELE EXTER-MADA
$STITLE   ECONOMIE OUVERTE AVEC GOUVERNEMENT

*===================================================================================*
* EXTER-MADA                                                                        *
* Projet de modélisation                                                            *
*                                                                                   *
* Ce modèle est basé sur l'architecture des modèles EXTER et PEP (version 2.1)      *
*                                                                                   *
* Sous licence : http://creativecommons.org/licenses/by-nc-sa/3.0/                  *
*                                                                                   *
* Vous êtes libre de partager, copier, distribuer et transmettre ce travail         *
* selon les conditions suivantes :                                                  *
*                                                                                   *
*   - Attribution :             Les travaux originaux doivent être attribués à :    *
*                               Veronique Robichaud, Andre Lemelin,                 *
*                               Helene Maisonnave et Bernard Decaluwe.              *
*                               Les adaptations et extensions de ce projet sont     *
*                               attribuées à Franck Ramaharo.                       *
*                                                                                   *
*   - Non commercial :          Vous ne pouvez pas utiliser ce travail              *
*                               à des fins commerciales.                            *                                             
*                                                                                   *
*   - Partage à l'identique :   Si vous modifiez, transformez ou développez         *
*                               ce travail, vous devez distribuer le travail        *
*                               résultant uniquement sous une licence identique     *
*                               à celle-ci.                                         *
*                                                                                   *
*===================================================================================*

* --- DEFINITION DES ENSEMBLES ---
** --- BRANCHE D'ACTIVITES ET PRODUITS ---

SET
 I  Produits
    / AGR       "Agriculture"
      FOOD      "Alimentation"
      OTHIND    "Autres industries"
      PETR      "Produits petroliers"
      SER       "Service marchand"
      PUB       "Administration publique"
      ONTR      "Autres services publics"
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
      ONTR      "Autres services publics"
    /

 NTR(J) Services non marchands
    / PUB       "Administration publique"
      ONTR      "Autres services publics"
    /
      



** --- AGENTS ---

 AG Tous les agents
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
      GVT       "Gouvernement"
      NGO       "Autres APU et ISBLSM"
      FIRM      "Societes"
      ROW       "Reste du monde"
    /

 AGD(AG) Agents domestiques
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
      GVT       "Gouvernement"
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

 AGPUB(AGD) Agents publics
    / GVT       "Gouvernement"
      NGO       "Autres APU et ISBLSM"
    /
    
 H(AG) Menages
    / HUR       "Menages urbains"
      HRU       "Menages ruraux"
    /  
;

ALIAS (ag,agj)
ALIAS(tri,trj)
;


* --- DEFINITION DES PARAMETRES ET DES VARIABLES DE REFERENCE ---

PARAMETER
** --- DEFINITION DES PARAMETRES ---

    A(trj)              Parametre d'echelle (Cobb-Douglas - fonction de production)
    A_E(trj)            Parametre d'echelle (CET - production)
    A_M(trj)            Parametre d'echelle (CES - produit composite)
    aij(tr,j)           Coefficient (Leontief - consommation intermediaire)
    alpha(trj)          Elasticite (Cobb-Douglas - fonction de production)
    beta_E(trj)         Parametre de repartition (CET - production)
    beta_M(trj)         Parametre de repartition (CES - produit composite)
    eta                 Elasticite-prix des transferts indexes et parametres
    gamma_CH(tr,h)      Part du produit tr dans les depenses totales de consommation du menage h
    gamma_INV(tr)       Part du produit tr dans les depenses totales d'investissement
    io(j)               Coefficient (Leontief - consommation intermediaire totale)
    lambda(h)           Part du revenu du capital recue part le menage h
    lambda_R            Part du revenu du capital recue part le reste du monde
    m_G                 Part des autres APU et des ISBLSM dans la depense publique totale
    ntyf                Propension des Societes a verser des recettes non fiscales
    ntyh(h)             Propension du menage h a verser des recettes non fiscales
    lambda_TRA(ag,agj)  Part du revenu disponible de l'agent agj qui va a l'agent ag
    phi(h)              Part du revenu du travail recue part le menage h
    psi(h)              Propension moyenne a epargner du menage h
    rho_E(trj)          Parametre d elasticite (CES - produit composite)
    rho_M(trj)          Parametre d elasticite (CET - production)
    sigma_E(trj)        Elasticite de transformation (CET - production)
    sigma_M(trj)        Elasticite de substitution (CES - produit composite)
    sntx(agpub)         Part des recettes non fiscales versees par les menages et recues par l'agent agpub
    syfi                Part des autres impôts indirects sur le revenu entreprises 
    syfm                Part des autres droits de douanes sur le revenu entreprises 
    theta(tr,trj)       Part du produit tr dans la production domestique de la branche trj
    tm(tr)              Taux de droits de douane sur les importation en produit tr
    tmgc(tr)            Taux de marge commerciale du produit tr
    tmgt(tr)            Taux de marge de transport du produit tr
    tx(tr)              Taux de taxe indirecte sur le produit tr
    tyf                 Taux de taxe directe sur le revenu des entreprises
    tyh(h)              Taux de taxe directe sur le revenu du menage h
    v(j)                Coefficient (Leontief - valeur ajoutee)
       
** --- DEFINITION  DES VARIABLES POUR L'ANNEE DE REFERENCE ---

*** --- VARIABLES EN VOLUMES ---    
    CHO(tr,h)       "Consommation du menage h en produit tr"
    CIO(j)          "Consommation intermediaire totale de la branche j"
    CTH_reelO(h)    "Consommation reelle du menage h"
    DDO(tr)         "Demande de produit local tr"
    DIO(tr,j)       "Consommation intermediaire en produit tr par la branche j"
    DITO(tr)        "Demande intermediaire totale pour le produit tr"
    DSO(tr,trj)     "Offre de produit tr de la branche trj sur le marche local"
    DXO(trj)        "Production de la branche trj sur le marche local"
    EXO(tr)         "Exportations du produit tr"
    FBCF_reelO      "Formation brute de capital fixe"
    G_reelO(ntr)    "Consommation reelle finale publique pour la production du service"
    IMO(tr)         "Importations du produit tr"
    INVO(tr)        "Demande finale en produit tr pour fins d investissement"
    KDO(trj)        "Demande de capital de la branche trj"
    KD_RO           "Remuneration nominale du capital versee par le RDM"
    KSO(trj)        "Offre de capital dans la branche trj"
    LDO(i)          "Demande de travail de la branche j(i)"
    LD_RO           "Remuneration nominale du travail versee par le RDM"
    LSO             "Offre totale de travail"
    MRGCOMO(bns)    "Marge de commercialisation du produit bns"
    MRGTRPO(bns)    "Marge de transport du produit bns"  
    PIB_MP_reelO    "PIB reel aux prix du marche"
    PIB_BP_reelO    "PIB reel aux prix de base"
    QO(tr)          "Demande en produit composite tr"
    VAO(i)          "Valeur ajoutee de la branche j(i)"
    VSTKO(bns)      "Variation de stocks du produit bns"
    XSO(i)          "Production de la branche j(i)"
    
*** --- VARIABLES EN VALEURS ---
    CABO            "Solde du compte courant"
    CTHO(h)         "Budget de consommation du menage h"
    FBCFO           "Formation brute de capital fixe nominale"
    GO(ntr)         "Budget de consommation finale publique pour la production du service ntr"
    ITO             "Investissement total"
    NTXFO           "Recettes non fiscales provenant des Societes"
    NTXHO(h)        "Recettes non fiscales provenant du menages h"
    NTXHHO(agpub)   "Recettes non fiscales provenant des menages recus par l'agent agpub"
    PIB_BPO         "PIB nominal aux prix de base"
    PIB_FDO         "PIB nominal (approche demande finale)"
    PIB_IBO         "PIB nominal (approche revenus)"
    PIB_MPO         "PIB nominal aux prix du marche"
    SFO             "Epargne des Societes"
    SGO             "Epargne de l'Administration centrale"
    SHO(h)          "Epargne du menage h"
    SNGOO           "Epargne des autres APU et des ISBLSM"
    SROWO           "Epargne du Reste du Monde"
    TDFO            "Recettes provenant des taxes directes sur les societes"
    TDHO(h)         "Recettes provenant des taxes directes sur le menage h"
    TIFO            "Recettes provenant des autres taxes indirectes des societes"
    TIMFO           "Recettes provenant des autres tarifs douaniers des societes"
    TIMO(tr)        "Recettes provenant des tarifs douaniers sur le produit tr"
    TIO(tr)         "Recettes provenant des taxes indirectes sur le produit tr"
    TRAO(ag,agj)    "Transferts nominaux de l agent agj vers l agent ag"
    YDHO(h)         "Revenu disponible nominal du menage h"
    YDFO            "Revenu disponible des societes"
    YFKO            "Revenu du capital des societes"
    YFO             "Revenu total des societes"
    YFTRAO          "Revenu des transferts recus par les societes"
    YGO             "Revenu total de l'Administration centrale"
    YGTRAO          "Revenu des transferts recus par l'Administration centrale"
    YGTXO           "Revenu des recettes fiscales de l'Administration centrale"
    YGNTXO          "Revenu des recettes non fiscales de l'Administration centrale"
    YHKO(h)         "Revenu du capital du menage h"
    YHLO(h)         "Revenu du travail du menage h"
    YHO(h)          "Revenu total nominal du menage h"
    YHTRAO(h)       "Revenu des transferts recu par le menage h"
    YNGOO           "Revenu total des autres APU et des ISBLSM"
    YROWKO          "Revenu du capital provenant du Reste du Monde"
    YROWLO          "Revenu du travail provenant du Reste du Monde"
    YROWO           "Revenu total du Reste du Monde"

*** --- PRIX ---
    eO              "Taux de change nominal"
    PCO(tr)         "Prix du produit composite tr"
    PCIO(j)         "Indice des prix a la consommation intermediaire de la branche j"
    PDO(tr)         "Prix du produit tr sur le marche local (taxes et marges incluses)"
    PEO(tr)         "Prix au producteur du produit exporte tr"
    PIXGDPO         "Deflateur du PIB"
    PIXCONO         "Indice des prix a la consommation"
    PIXINVO         "Indice des prix des investissements"
    PLO(tr)         "Prix du produit tr sur le marche local (hors taxes et hors marges)"
    PMO(tr)         "Prix du produit importe tr (droits de douane et taxes inclus)"
    PO(i)           "Prix au producteur de la branche j(i)"
    PPDO(tr)        "Prix du produit tr sur le marche local (taxes incluses; hors marges)"
    PPMO(tr)        "Prix du produit importe tr (taxes incluses; hors marges)"
    PVAO(i)         "Prix de la valeur ajoutee de la branche j"
    PWEO(tr)        "Prix mondial (en devises) du produit exporte tr"
    PWMO(tr)        "Prix mondial (en devises) du produit importe tr"
    RO(trj)         "Taux de remuneration du capital de la branche trj"
    R_RO            "Taux de remuneration du capital du RDM (en devises)"
    WO              "Taux de salaire des travailleurs domestiques"
    W_RO            "Taux de salaire des travailleurs du RDM (en devises)"
;

* --- CHARGEMENT DE LA MATRICE DE COMPTABILITE SOCIALE ---

PARAMETER
MCS(*,*,*,*);

$CALL GDXXRW.EXE Exter-Mada.xlsx par=MCS rng=MCS!A1:Ak37 Rdim=2 Cdim=2
$GDXIN Exter-Mada.gdx
$LOAD MCS
$GDXIN


* --- ASSIGNATION DES VARIABLES DE LA MCS ---

 CABO                = MCS('OTH','INV','AG','ROW');
 CHO(tr,h)           = MCS('I',tr,'AG',h); 
 DIO(tr,j)           = MCS('I',tr,'J',j);
 DSO(tr,trj)         = MCS('J',trj,'I',tr);
 TDFO                = MCS('AG','TDM','AG','FIRM');
 TDHO(h)             = MCS('AG','TDM','AG',h);
 EXO(tr)             = MCS('X',tr,'AG','ROW');
 GO(ntr)             = MCS('OTH','TOT','J',ntr);
 IMO(tr)             = MCS('AG','ROW','I',tr);
 ITO                 = MCS('OTH','TOT','OTH','INV');
 INVO(tr)            = MCS('I',tr,'OTH','INV');
 KD_RO               = MCS('F','KD','AG','ROW');
 KDO(trj)            = MCS('F','KD','J',trj);
 LD_RO               = MCS('F','LD','AG','ROW');
 LDO(j)              = MCS('F','LD','J',j);
 MRGCOMO(bns)        = MCS('M','MC','I',bns);
 MRGTRPO(bns)        = MCS('M','MT','I',bns);
 NTXFO               = MCS('AG','NTX','AG','FIRM');
 NTXHO(h)            = MCS('AG','NTX','AG',h);
 NTXHHO('ngo')       = MCS('AG','NGO','AG','NTX');
 SFO                 = MCS('OTH','INV','AG','FIRM');
 SGO                 = MCS('OTH','INV','AG','GVT');
 SHO(h)              = MCS('OTH','INV','AG',h);
 SNGOO               = MCS('OTH','INV','AG','NGO');
 SROWO               = MCS('OTH','INV','AG','ROW');
 TIFO                = MCS('AG','TBS','AG','FIRM');
 TIMFO               = MCS('AG','TCM','AG','FIRM');
 TIMO(tr)            = MCS('AG','TCM','I',tr);
 TIO(tr)             = MCS('AG','TBS','I',tr);
 TRAO(ag,agj)        = MCS('AG',ag,'AG',agj);
 VSTKO(bns)          = MCS('I',bns,'OTH','VSTK');
 YFO                 = MCS('OTH','TOT','AG','FIRM');
 YFKO                = MCS('AG','FIRM','F','KD');
 YGO                 = MCS('OTH','TOT','AG','GVT');
 YGNTXO              = MCS('AG','GVT','AG','NTX');
 YHO(h)              = MCS('OTH','TOT','AG',h);
 YHKO(h)             = MCS('AG',h,'F','KD');
 YHLO(h)             = MCS('AG',h,'F','LD');
 YNGOO               = MCS('AG','NGO','OTH','TOT');
 YROWO               = MCS('AG','ROW','OTH','TOT');
 YROWKO              = MCS('AG','ROW','F','KD');
 YROWLO              = MCS('AG','ROW','F','LD');

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
 sntx('gvt') = (YGNTXO - NTXFO)/SUM[h, NTXHO(h)];
 sntx('ngo') = 1 - sntx('gvt');


** --- AUTRES VARIABLES ET PRIX ---
 PPDO(tr)       = {1 + tx(tr)}*PLO(tr); 
 PPMO(tr)       = {1 + tx(tr)}*{1 + tm(tr)}*eO*PWMO(tr);
 PDO('ser')     = PPDO('ser');
 PMO('ser')     = PPMO('ser');  
 PWEO(tr)       = PEO(tr)/eo;

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
 
 PCIO(j)        = SUM[tr, PCO(tr)*DIO(tr,j)]/CIO(j);

 XSO(trj)       = DXO(trj) + EXO(trj);
 XSO(ntr)       = GO(ntr)/PO(ntr); 
 
 PO(trj)        = {PEO(trj)*EXO(trj) + SUM[tr, PLO(tr)*DSO(tr,trj)]}/XSO(trj);

 VAO(trj)       = LDO(trj) + KDO(trj);
 VAO(ntr)       = LDO(ntr);
 
 PVAO(j)        = {PO(j)*XSO(j) - PCIO(j)*CIO(j)}/VAO(j);
 
 LSO            = LD_RO + SUM[j, LDO(j)];
 KSO(trj)       = KDO(trj);

* PIXGDPO        = SUM[j, PVAO(j)*VAO(j)]/SUM[j, PVAO(j)*VAO(j)];
 PIXGDPO        = 1;

* PIXCONO        = SUM[tr, PCO(tr)*SUM[h, CHO(tr,h)]]/SUM[tr, PCO(tr)*SUM[h,CHO(tr,h)]];
 PIXCONO        = 1;

* PIXINVO        = PROD[tr, (PCO(tr)/PCO(tr))**gamma_INV(tr)];
 PIXINVO        = 1;
 
 YHTRAO(h)      = TRAO(h,'firm') + TRAO(h,'gvt') + TRAO(h,'ngo') + TRAO(h,'row');
 YDHO(h)        = YHO(h) - TDHO(h);
 CTHO(h)        = YDHO(h) - SHO(h)  - NTXHO(h);
 
 YGTXO          = SUM[tr, TIO(tr)] + TIFO + SUM[tr, TIMO(tr)] + TIMFO + TDFO + SUM[h, TDHO(h)];
 NTXHHO('gvt')  = sntx('gvt')*SUM[h, NTXHO(h)];
 YGNTXO         = NTXFO + NTXHHO('gvt');
 YGTRAO         = TRAO('gvt','row');

 YFTRAO         = TRAO('firm','gvt') + TRAO('firm', 'row');
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
 m_G             = GO('ontr')/(GO('ontr') + GO('pub'));
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
 rho_E(trj)       = (1 + sigma_E(trj))/sigma_E(trj);

 beta_E(trj)      = PEO(trj)*EXO(trj)**(1 - rho_E(trj))/
                    {PEO(trj)*EXO(trj)**(1 - rho_E(trj)) + SUM[tr,theta(tr,trj)*PLO(tr)]*DXO(trj)**(1 - rho_E(trj))};

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
 PIB_FDO        = SUM[tr, SUM[h, PCO(tr)*CHO(tr,h)]] + SUM[ntr, GO(ntr)]
                    + SUM[bns, PCO(bns)*{INVO(bns) + VSTKO(bns)}]
                    + PCO('ser')*INVO('ser') + eO*SUM[tr, PWEO(tr)*EXO(tr)]
                    - eO*SUM[tr, PWMO(tr)*IMO(tr)];
                    
** --- AUTRES VARIABLES REELLES ---

 CTH_reelO(h)   = CTHO(h)/PIXCONO;
 G_reelO(ntr)   = GO(ntr)/PO(ntr);
 PIB_BP_reelO   = PIB_BPO/PIXGDPO;
 PIB_MP_reelO   = PIB_MPO/PIXCONO;
 FBCF_reelO     = FBCFO/PIXINVO;

 DISPLAY
    A,              A_E,            A_M,            aij,            alpha,          
    beta_E,         beta_M,         eta,            gamma_CH,       
    gamma_INV,      io,             lambda,         lambda_R,       lambda_TRA,     
    m_G,            ntyf,           ntyh,           phi,            psi,            rho_E,          rho_M,
    sigma_E,        sigma_M,        sntx,           syfi,           syfm,           theta,
    tm,             tmgc,           tmgt,           tx,             tyf,
    tyh,            v;
    

* =============================================================================
* --- DISPLAY DES VALEURS INITIALES (CALIBRAGE) ---
* =============================================================================

* --- 1. VARIABLES EN VOLUMES ---
DISPLAY 
    CHO, CIO, CTH_reelO, DDO, DIO, DITO, DSO, DXO, EXO, FBCF_reelO, 
    G_reelO, IMO, INVO, KDO, KD_RO, KSO, LDO, LD_RO, LSO, PIB_MP_reelO, PIB_BP_reelO, 
    QO, VAO, VSTKO, XSO;

* --- 2. VARIABLES EN VALEURS ---
DISPLAY 
    CABO, CTHO, FBCFO, GO, ITO, MRGCOMO, MRGTRPO,
    NTXFO, NTXHO, NTXHHO, YGNTXO,
    PIB_BPO, PIB_FDO, PIB_IBO, PIB_MPO, SFO, SGO, SHO, SNGOO, 
    SROWO, TDFO, TDHO, TIFO, TIMFO, TIMO, TIO, TRAO, YDHO, YDFO, 
    YFKO, YFO, YFTRAO, YGO, YGTRAO, YGTXO, YHKO, YHLO, YHO, 
    YHTRAO, YNGOO, YROWKO, YROWLO, YROWO;

* --- 3. PRIX ---
DISPLAY 
    eO, PCO, PCIO, PDO, PEO, PIXGDPO, PIXCONO, PIXINVO, PLO, PMO, 
    PO, PPDO, PPMO, PVAO, PWEO, PWMO, RO, R_RO, WO, W_RO;
* --- DECLARATION DES VARIABLES ---

VARIABLES
** --- VOLUMES ---
    CH(tr,h)        "Consommation du menage h en produit tr"
    CI(j)           "Consommation intermediaire totale de la branche j"
    CTH_reel(h)     "Budget de consommation du menage h"
    DD(tr)          "Demande de produit local tr"
    DI(tr,j)        "Consommation intermediaire en produit tr par la branche j"
    DIT(tr)         "Demande intermediaire totale pour le produit tr"
    DS(tr,trj)      "Offre de produit tr de la branche trj sur le marche local"
    DX(trj)         "Production de la branche trj sur le marche local"
    EX(tr)          "Exportations du produit tr"
    FBCF_reel       "Formation brute de capital fixe"
    G_reel(ntr)     "Consommation publique des administrations (produit ntr)"
    IM(tr)          "Importations du produit tr"
    INV(tr)         "Demande finale en produit tr pour fins d investissement"
    KD(trj)         "Demande de capital de la branche tr"
    KD_R            "Deamnde de capital du RDM"
    KS(trj)         "Offre de capital dans la branche tr"
    LD(i)           "Demande de travail de la branche j"
    LD_R            "Demande de travail du RDM"
    LS              "Offre totale de travail"
    MRGCOM(bns)     "Marge de commercialisation du produit bns"
    MRGTRP(bns)     "Marge de transport du produit bns"
    PIB_MP_reel     "Produit Interieur Brut aux prix du marche"
    PIB_BP_reel     "Produit Interieur Brut aux prix de base"
    Q(tr)           "Demande en produit composite tr"
    VA(i)           "Valeur ajoutee de la branche j"
    VSTK(tr)        "Variation de stocks du produit bns"
    XS(i)           "Production de la branche j"

** --- VALEURS NOMINALES ---
    CAB             "Balance courante"
    CTH(h)          "Budget de consommation nominal du menage h"
    FBCF            "Formation brute de capital fixe nominale"
    G(ntr)          "Budget de consommation nominal des Administrations et ISBLSM"
    IT              "Investissement total nominal"
    NTXF            "Recettes non fiscales provenant des Societes"
    NTXH(h)         "Recettes non fiscales provenant du menages h"
    NTXHH(agpub)    "Recettes non fiscales provenant des menages recus par l'agent agpub"
    PIB_BP          "PIB nominal aux prix de base"
    PIB_FD          "PIB nominal (approche demande finale)"
    PIB_IB          "PIB nominal (approche revenus)"
    PIB_MP          "PIB nominal aux prix du marche"
    SF              "Epargne des Societes"
    SG              "Epargne du Gouvernement"
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
    YG              "Revenu total du Gouvernement"
    YGTRA           "Revenu des transferts recus par le gouvernement"
    YGTX            "Revenu des recettes fiscales du gouvernement"
    YGNTX           "Revenu des recettes non fiscales du gouvernement"
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
    P(i)            "Prix au producteur de la branche j"
    PC(tr)          "Prix du produit composite tr"
    PCI(j)          "Indice des prix a la consommation intermediaire de la branche j"
    PD(tr)          "Prix du produit tr sur le marche local (taxes et marges incluses)"
    PE(tr)          "Prix au producteur du produit exporte tr"
    PIXGDP          "Deflateur du PIB"
    PIXCON          "Indice des prix a la consommation"
    PIXINV          "Indice des prix des investissements"
    PL(tr)          "Prix du produit tr sur le marche local (hors taxes)"
    PM(tr)          "Prix du produit importe tr (droits de douane et taxes inclus)"
    PPD(tr)         "Prix du produit tr sur le marche local (taxes incluses hors marges)"
    PPM(tr)         "Prix du produit importe tr (taxes incluses hors marges)"
    PVA(i)          "Prix de la valeur ajoutee de la branche j"
    PWE(tr)         "Prix mondial (en devises) du produit exporte tr"
    PWM(tr)         "Prix mondial (en devises) du produit importe tr"
    R(trj)           "Taux de remuneration du capital de la branche tr"
    R_R             "Taux de remuneration du capital du RDM (en devises)"
    W               "Taux de salaire des travailleurs domestiques"
    W_R             "Taux de salaire des travailleurs du RDM (en devises)"

** --- VERIFICATION DE LA LOI DE WALRAS ---
    LEON            "Loi de Walras"
;

* --- LISTE DES EQUATIONS ---

EQUATIONS
** --- BLOC PRODUCTION ---
 EQ1(j)          Valeur ajoutee dans la branche j (Leontief)
 EQ2(j)          Consommation intermediaire totale de la branche j (Leontief)
 EQ3(tr)         Cobb-Douglas entre le travail et le capital
 EQ4(ntr)        Valeur ajoutee de la branche ntr
 EQ5(ntr)        Valeur ajoutee de la branche pub (nominale)
 EQ6(trj)         Demande de travail de la branche trj
 EQ7(trj)         Demande de capital de la branche trj
 EQ8(tr,j)       Consommation intermediaire par produit (Leontief)
 EQ9(tr,trj)     Répartition de la production domestique de la branche j

** --- BLOC MENAGE ---
 EQ10(h)         Revenu du menage h
 EQ11(h)         Revenu salarial du menage h
 EQ12(h)         Revenu du capital du ménage h
 EQ13(h)         Revenu du transfert du ménage h
 EQ14(h)         Revenu disponible du ménage h
 EQ15(h)         Epargne du ménage h
 EQ16(h)         Recettes non fiscales versees par le menage h
 EQ17(h)         Dépenses de consommation du ménage h

** --- BLOC SOCIETE ---
 EQ18            Revenu des entreprises
 EQ19            Revenu du capital des entreprises
 EQ20            Revenu du transfert des entreprises
 EQ21            Revenu disponible des entreprises
 EQ22            Epargne des entreprises
 
** --- BLOC ADMINISTRATION CENTRALE ---
 EQ23            Revenu total de l'Administration centrale
 EQ24            Revenu fiscal de l'Administration centrale
 EQ25            Revenu non fiscal de l'Administration centrale
 EQ26            Revenu des transferts de l'Administration centrale
 EQ27            Epargne de l'Administration centrale
 EQ28            Recettes provenant des taxes directes sur le revenu des entreprises
 EQ29(h)         Recettes provenant des taxes directes sur le revenu du ménage h
 EQ30(bns)       Recettes provenant des taxes indirectes sur le produit bns
 EQ31            Recettes provenant des taxes indirectes sur le service ser
 EQ32            Recettes provenant des autres taxes indirectes (Societes)
 EQ33(tr)        Recettes provenant des tarifs douaniers sur le produit tr
 EQ34            Recettes provenant des autres tarifs douaniers (Societes)
 EQ35            Recettes non fiscales provenant des Societes
 EQ36            Recettes non fiscales provenant des menages

** --- BLOC AUTRES APU ET ISBLSM ---
 EQ37            Revenu des autres APU et des ISBLSM
 EQ38            Recettes non fiscales des autres APU et des ISBLSM provenant des menages
 EQ39            Epargne des autres APU et des ISBLSM
 EQ40            Budget de consommation finale des autres APU et des ISBLSM

** --- BLOC RESTE DU MONDE ---
 EQ41            Revenu total du Reste du Monde
 EQ42            Revenu salarial du Reste du Monde
 EQ43            Revenu du capital du Reste du Monde
 EQ44            Epargne du Reste du monde
 EQ45            Balance courante
 
** --- BLOC TRANSFERTS ---
 EQ46(agd)       Transferts du RDM aux agents domestiques
 EQ47(agngvt)    Transferts du gouvernement aux autres agents
 EQ48(h)         Transferts des societes au menage h
 EQ49(h)         Transferts des autres APU et des ISBLSM au menage h
 EQ50            Transferts des societes aux autres APU et aux ISBLSM

** --- BLOC DEMANDES ---
 EQ51(tr,h)      Consommation du menage h en produit tr
 EQ52            Formation Brute de Capitale Fixe
 EQ53(tr)        Demande en produit tr pour fins d investissement
 EQ54(tr)        Demande intermediaire en produit tr
 EQ55(bns)       Marge de commercialisation du produit bns
 EQ56(bns)       Marge de transport du produit bns
 
** --- BLOC COMMERCE INTERNATIONAL ---
 EQ57(trj)       CET entre exportations et ventes sur le marche interieur
 EQ58(trj)       Offre relative derivee de la CET (EX et DS)
 EQ59(trj)       CES entre importations et achats sur le marche interieur
 EQ60(trj)       Demande relative derivee de la CES (IM et DD)
 EQ61            Offre de produits petroliers

** --- BLOC PRIX ---
 EQ62(j)         Prix au producteur et Prix de la valeur ajoutee de la branche j
 EQ63(j)         Indice de prix des consommations intermedaires de la branche j
 EQ64(tr)        Prix interieurs du produit tr incluant les taxes indirectes (hors marges)
 EQ65(bns)       Prix interieurs du produit bns incluant les taxes indirectes (marges comprises)
 EQ66            Prix interieurs 'service' incluant les taxes indirectes (hors marges)
 EQ67(tr)        Prix des produits importes tr (incluant taxes - hors marges)
 EQ68(bns)       Prix des produits importes bns (incluant taxes - marges comprises)
 EQ69            Prix des services importes (incluant taxes - hors marges)
 EQ70(tr)        Prix du produit composite bns (incluant marges)
 EQ71(tr)        Prix a l exportations
 EQ72(trj)       Prix au producteur (ligne)
 EQ73            Indice de prix (deflateur du PIB)
 EQ74            Indice des prix a la consommation
 EQ75            Indice des prix a l investissement

** --- BLOC EQUILIBRE ---
 EQ76(npbns)     Absorption domestique
 EQ77            Equilibre sur le marche des produits petroliers
 EQ78(ntr)       Production de bien publique
 EQ79(tr)        Equilibre sur le marché intérieur
 EQ80            Equilibre sur le marche du travail
 EQ81(trj)       Equilibre sur le marche du capital
 EQ82            Equilibre epargne-investissement

** --- BLOC PRODUIT INTERIEUR BRUT ---
 EQ83            PIB au prix de base
 EQ84            PIB au prix du marché
 EQ85            PIB approche revenu
 EQ86            PIB approche demande finale

** --- BLOC AUTRES VALEURS REELLES ---
 EQ87(h)         Budget de consommation du menage h
 EQ88(ntr)       Depense publique reel
 EQ89            PIB reel au prix de base
 EQ90            PIB reel au prix du marché 
 EQ91            Formation brute de capitale fixe

** --- LOI DE WALRAS ---
 WALRAS          Verification de la loi de Walras
;

* --- SPECIFICATION DES EQUATIONS ---

** --- BLOC PRODUCTION ---

 EQ1(j)..       VA(j)               =e= v(j)*XS(j);

 EQ2(j)..       CI(j)               =e= io(j)*XS(j);

 EQ3(trj)..     VA(trj)             =e= A(trj)*LD(trj)**alpha(trj)*KD(trj)**(1 - alpha(trj)) ;

 EQ4(ntr)..     VA(ntr)             =e= LD(ntr);

 EQ5(ntr)..     VA(ntr)*PVA(ntr)    =e= W*LD(ntr);

 EQ6(trj)..     W*LD(trj)           =e= alpha(trj)*PVA(trj)*VA(trj);

 EQ7(trj)..     R(trj)*KD(trj)      =e= (1 - alpha(trj))*PVA(trj)*VA(trj);

 EQ8(tr,j)..    DI(tr,j)            =e= aij(tr,j)*CI(j);

 EQ9(tr,trj)..  DS(tr,trj)          =e= theta(tr,trj)*DX(trj);
                          
** --- BLOC MENAGES ---

 EQ10(h)..      YH(h)       =e= YHL(h) + YHK(h) + YHTRA(h);

 EQ11(h)..      YHL(h)      =e= phi(h)*{e*W_R*LD_R + SUM[j, W*LD(j)]};

 EQ12(h)..      YHK(h)      =e= lambda(h)*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ13(h)..      YHTRA(h)    =e= TRA(h,'firm') + TRA(h,'gvt') + TRA(h,'ngo') + TRA(h,'row');

 EQ14(h)..      YDH(h)      =e= YH(h) - TDH(h);

 EQ15(h)..      SH(h)       =e= psi(h)*YDH(h);

 EQ16(h)..      NTXH(h)     =e= ntyh(h)*YDH(h);

 EQ17(h)..      CTH(h)      =e= YDH(h) - SH(h) - NTXH(h);

** --- BLOC SOCIETES ---

 EQ18..         YF          =e= YFK + YFTRA;

 EQ19..         YFK         =e= {1 - lambda_R - SUM[h, lambda(h)]}*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ20..         YFTRA       =e= TRA('firm','gvt') + TRA('firm','row') ;

 EQ21..         YDF         =e= YF - TDF - TIF - TIMF;

 EQ22..         SF          =e= YDF - NTXF - TRA('ngo','firm') - sum[h, TRA(h,'firm')];

** --- BLOC GOUVERNEMENT ---

 EQ23..         YG          =e= YGTX + YGNTX + YGTRA;
 
 EQ24..         YGTX        =e= SUM[tr, TI(tr)] + TIF + SUM[tr, TIM(tr)] + TIMF + TDF + SUM[h, TDH(h)];

 EQ25..         YGNTX       =e= NTXF + NTXHH('gvt');

 EQ26..         YGTRA       =e= TRA('gvt','row');                       
                                     
 EQ27..         SG          =e= YG - G('pub') - SUM[agngvt, TRA(agngvt,'gvt')];

 EQ28..         TDF         =e= tyf*YF;

 EQ29(h)..      TDH(h)      =e= tyh(h)*YH(h);

 EQ30(bns)..    TI(bns)     =e= tx(bns)*{
                                            [PL(bns) + {tmgc(bns) + tmgt(bns)}*PC('ser')]*DD(bns)
                                          + [{1 + tm(bns)}*e*PWM(bns) + {tmgc(bns) + tmgt(bns)}*PC('ser')]*IM(bns)
                                        };
                                          
 EQ31..         TI('ser')   =e= tx('ser')*{PL('ser')*DD('ser') + [1 + tm('ser')]*e*PWM('ser')*IM('ser')};

 EQ32..         TIF         =e= syfi*YF;

 EQ33(tr)..     TIM(tr)     =e= tm(tr)*e*PWM(tr)*IM(tr);

 EQ34..         TIMF        =e= syfm*YF;

 EQ35..         NTXF        =e= ntyf*YDF;
 
 EQ36..         NTXHH('gvt')=e= sntx('gvt')*SUM[h, NTXH(h)];
 
 
** --- BLOC AUTRES APU ET ISBLSM ---

 EQ37..         YNGO        =e= TRA('ngo','firm') + TRA('ngo','gvt') + TRA('ngo','row') + NTXHH('ngo');
 
 EQ38..         NTXHH('ngo')=e= sntx('ngo')*SUM[h, NTXH(h)];

 EQ39..         SNGO        =e= YNGO - SUM[h, TRA(h,'ngo')]  - G('ontr');

 EQ40..         G('ontr')   =e= m_G/(1 - m_G)*G('pub');


** --- BLOC RESTE DU MONDE ---

 EQ41..         YROW        =e= YROWL + YROWK + e*SUM[tr, PWM(tr)*IM(tr)] +  TRA('row','gvt');

 EQ42..         YROWL       =e= {1 - SUM[h, phi(h)]}*{e*W_R*LD_R + SUM[j, W*LD(j)]};

 EQ43..         YROWK       =e= lambda_R*{e*R_R*KD_R + SUM[trj, R(trj)*KD(trj)]};

 EQ44..         SROW        =e= YROW - e*SUM[tr, PWE(tr)*EX(tr)] - e*R_R*KD_R - e*W_R*LD_R
                                - SUM[agd, TRA(agd,'row')];

 EQ45..         CAB         =e= -SROW;

** --- BLOC TRANSFERTS ---
 EQ46(agd)..    TRA(agd,'row')      =e= PIXCON**eta*TRAO(agd,'row');
 
 EQ47(agngvt).. TRA(agngvt,'gvt')   =e= PIXCON**eta*TRAO(agngvt,'gvt');

 EQ48(h)..      TRA(h,'firm')       =e= lambda_TRA(h,'firm')*YDF;

 EQ49(h)..      TRA(h,'ngo')        =e= PIXCON**eta*TRAO(h,'ngo');

 EQ50..         TRA('ngo','firm')   =e= lambda_TRA('ngo','firm')*YDF;


** --- BLOC DEMANDE ---

 EQ51(tr,h)..   PC(tr)*CH(tr,h) =e= gamma_CH(tr,h)*CTH(h);

 EQ52..         FBCF            =e= IT - SUM[bns, PC(bns)*VSTK(bns)];

 EQ53(tr)..     INV(tr)*PC(tr)  =e= gamma_INV(tr)*FBCF;

 EQ54(tr)..     DIT(tr)         =e= SUM[j, DI(tr,j)];

 EQ55(bns)..    MRGCOM(bns)     =e= tmgc(bns)*{DD(bns) + IM(bns)};

 EQ56(bns)..    MRGTRP(bns)     =e= tmgt(bns)*{DD(bns) + IM(bns)};

** --- BLOC COMMERCE INTERNATIONAL ---

 EQ57(trj)..    XS(trj)         =e= A_E(trj)*{beta_E(trj)*EX(trj)**rho_E(trj)
                                    + [1 - beta_E(trj)]*DX(trj)**rho_E(trj)}**[1/rho_E(trj)];

 EQ58(trj)..    EX(trj)         =e= {PE(trj)/(SUM[tr, theta(tr,trj)*PL(tr)])*[1 - beta_E(trj)]/beta_E(trj)}
                                    **sigma_E(trj)*DX(trj);
                                                                                
 EQ59(trj)..    Q(trj)          =e= A_M(trj)*{beta_M(trj)*IM(trj)**(-rho_M(trj))
                                    + [1 - beta_M(trj)]*DD(trj)**(-rho_M(trj))}**[-1/rho_M(trj)];
                                      
 EQ60(trj)..    IM(trj)         =e= {PD(trj)/PM(trj)*beta_M(trj)/[1 - beta_M(trj)]}**sigma_M(trj)*DD(trj);
 
 EQ61..         Q('petr')       =e= IM('petr');

** --- BLOC PRIX ---

 EQ62(j)..      P(j)*XS(j)      =e= PVA(j)*VA(j) + PCI(j)*CI(j);

 EQ63(j)..      PCI(j)*CI(j)    =e= SUM[tr, PC(tr)*DI(tr,j)];

 EQ64(tr)..     PPD(tr)         =e= {1 + tx(tr)}*PL(tr);

 EQ65(bns)..    PD(bns)         =e= PPD(bns) +  {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PC('ser');

 EQ66..         PD('ser')       =e= PPD('ser');

 EQ67(tr)..     PPM(tr)         =e= {1 + tx(tr)}*{1 + tm(tr)}*e*PWM(tr);

 EQ68(bns)..    PM(bns)         =e= PPM(bns) + {1 + tx(bns)}*{tmgc(bns) + tmgt(bns)}*PC('ser');

 EQ69..         PM('ser')       =e= PPM('ser');

 EQ70(tr)..     PC(tr)*Q(tr)    =e= PD(tr)*DD(tr) + PM(tr)*IM(tr);

 EQ71(tr)..     PE(tr)          =e= e*PWE(tr);

 EQ72(trj)..    P(trj)*XS(trj)  =e= SUM[tr, PL(tr)*DS(tr,trj)] + PE(trj)*EX(trj);

 EQ73..         PIXGDP          =e= SUM[j, PVA(j)*VAO(j)]/SUM[j, PVAO(j)*VAO(j)];

 EQ74..         PIXCON          =e= SUM[tr, PC(tr)*SUM[h,CHO(tr,h)]]/SUM[tr, PCO(tr)*SUM[h, CHO(tr,h)]]; 

 EQ75..         PIXINV          =e= PROD[tr, (PC(tr)/PCO(tr))**gamma_INV(tr)];

** --- BLOC EQUILIBRE ---

 EQ76(npbns)..  Q(npbns)                =e= SUM[h, CH(npbns,h)] + DIT(npbns) + INV(npbns) + VSTK(npbns) ;

 EQ77..         Q('petr')               =e= SUM[h, CH('petr',h)] + DIT('petr') + VSTK('petr') + EX('petr')*{PE('petr')/PC('petr')};
 
 EQ78(ntr)..    P(ntr)*XS(ntr)          =e= G(ntr);

 EQ79(tr)..     SUM[trj, DS(tr,trj)]    =e= DD(tr);

 EQ80..         LS                      =e= LD_R + SUM[j, LD(j)];

 EQ81(trj)..    KS(trj)                 =e= KD(trj);

 EQ82..         IT                      =e= SUM[h, SH(h)] + SF + SG + SNGO + SROW;

** --- BLOC PRODUIT INTERIEUR BRUT ---

 EQ83..         PIB_BP                  =e= SUM[j, PVA(j)*VA(j)];

 EQ84..         PIB_MP                  =e= PIB_BP + SUM[tr, TIM(tr) + TI(tr)];

 EQ85..         PIB_IB                  =e= SUM[j, W*LD(j)] + SUM[trj, R(trj)*KD(trj)] + SUM[tr, TIM(tr) + TI(tr)];

 EQ86..         PIB_FD                  =e= SUM[tr, SUM[h, PC(tr)*CH(tr,h)]] + SUM[ntr, G(ntr)]
                                            + SUM[bns, PC(bns)*{INV(bns) + VSTK(bns)}] + PC('ser')*INV('ser')
                                            + e*SUM[tr, PWE(tr)*EX(tr)] - e*SUM[tr, PWM(tr)*IM(tr)];

** --- BLOC AUTRE VAEURS REELLES ---

 EQ87(h)..      CTH_reel(h)             =e= CTH(h)/PIXCON;

 EQ88(ntr)..    G_reel(ntr)             =e= G(ntr)/P(ntr);

 EQ89..         PIB_BP_reel             =e= PIB_BP/PIXGDP;

 EQ90..         PIB_MP_reel             =e= PIB_MP/PIXCON;

 EQ91..         FBCF_reel               =e= FBCF/PIXINV;

** --- LOI DE WALRAS ---

 WALRAS..        LEON                   =e= Q('ser') - SUM[h, CH('ser',h)]  - DIT('ser')
                                             - SUM[bns, MRGCOM(bns)] - SUM[bns, MRGTRP(bns)]
                                            - INV('ser');


* --- INITIALISATION DES VARIABLES ---
** --- VOLUMES ---
 CH.L(tr,h)    = CHO(tr,h);
 CI.L(j)       = CIO(j);
 CTH_reel.L(h) = CTH_reelO(h);
 DD.L(tr)      = DDO(tr);
 DI.L(tr,j)    = DIO(tr,j);
 DIT.L(tr)     = DITO(tr);
 DS.L(tr,trj)  = DSO(tr,trj);
 DX.L(trj)     = DXO(trj);
 EX.L(tr)      = EXO(tr);
 FBCF_reel.L   = FBCF_reelO;
 G_reel.L(ntr) = G_reelO(ntr);
 IM.L(tr)      = IMO(tr);
 INV.L(tr)     = INVO(tr);
 KD.L(trj)     = KDO(trj);
 KD_R.L        = KD_RO;
 KS.L(trj)     = KSO(trj);
 LD.L(j)       = LDO(j);
 LD_R.L        = LD_RO;
 LS.L          = LSO;
 MRGCOM.L(bns) = MRGCOMO(bns);
 MRGTRP.L(bns) = MRGTRPO(bns);
 PIB_MP_reel.L = PIB_MP_reelO;
 PIB_BP_reel.L = PIB_BP_reelO;
 Q.L(tr)       = QO(tr);
 VA.L(j)       = VAO(j);
 VSTK.L(bns)   = VSTKO(bns);
 XS.L(j)       = XSO(j);

** --- VALEURS NOMINALES ---
 CAB.L         = CABO;
 CTH.L(h)      = CTHO(h);
 FBCF.L        = FBCFO;
 G.L(ntr)      = GO(ntr);
 IT.L          = ITO;
 NTXF.L        = NTXFO;
 NTXH.L(h)     = NTXHO(h);
 NTXHH.L(agpub)= NTXHHO(agpub);
 PIB_FD.L      = PIB_FDO;
 PIB_IB.L      = PIB_IBO;
 PIB_MP.L      = PIB_MPO;
 SF.L          = SFO;
 SG.L          = SGO;
 SH.L(h)       = SHO(h);
 SNGO.L        = SNGOO;
 SROW.L        = SROWO;
 TDF.L         = TDFO;
 TDH.L(h)      = TDHO(h);
 TIF.L         = TIFO;
 TIMF.L        = TIMFO;
 TIM.L(tr)     = TIMO(tr);
 TI.L(tr)      = TIO(tr);
 TRA.L(ag,agj)$TRAO(ag,agj) = TRAO(ag,agj);
 YDH.L(h)      = YDHO(h);
 YDF.L         = YDFO;
 YFK.L         = YFKO;
 YF.L          = YFO;
 YFTRA.L       = YFTRAO;
 YG.L          = YGO;
 YGTRA.L       = YGTRAO;
 YGTX.L        = YGTXO;
 YGNTX.L       = YGNTXO;
 YHK.L(h)      = YHKO(h);
 YHL.L(h)      = YHLO(h);
 YH.L(h)       = YHO(h);
 YHTRA.L(h)    = YHTRAO(h);
 YNGO.L        = YNGOO;
 YROWK.L       = YROWKO;
 YROWL.L       = YROWLO;
 YROW.L        = YROWO;

** --- PRIX ---
 e.L           = eO;
 PC.L(tr)      = PCO(tr);
 PCI.L(j)      = PCIO(j);
 PD.L(tr)      = PDO(tr);
 PE.L(tr)      = PEO(tr);
 PIXCON.L      = PIXCONO;
 PIXINV.L      = PIXINVO;
 PL.L(tr)      = PLO(tr);
 PM.L(tr)      = PMO(tr);
 P.L(j)        = PO(j);
 PPD.L(tr)     = PPDO(tr);
 PPM.L(tr)     = PPMO(tr);
 PVA.L(j)      = PVAO(j);
 PWE.L(tr)     = PWEO(tr);
 PWM.L(tr)     = PWMO(tr);
 R.L(trj)      = RO(trj);
 R_R.L         = R_RO;
 W.L           = WO;
 W_R.L         = W_RO;
 PIXGDP.L      = PIXGDPO;
 
** --- WALRAS ---
 LEON.L        = 0;
 
* --- FERMETURE DU MODELE ---

** La balance courante est exogene
 CAB.fx         = CABO;

** Le taux de change nominal est le numeraire
 e.fx           = eO;

** Les dépenses courantes du Gouvernement sont exogenes
 G.fx('pub')    = GO('pub')*1.1;

** Le capital est fixe par branche
 KD.fx(trj)     = KDO(trj);
 KD_R.fx        = KD_RO;

** L'offre totale de travail est fixe
 LD_R.fx        = LD_RO;
 LS.fx          = LSO;
 
** Les prix mondiaux sont exogenes
 PWE.fx(tr)     = PWEO(tr);
 PWM.fx(trj)    = PWMO(trj);
 PWM.fx('petr') = PWMO('petr');

 R_R.fx         = R_RO;
 W_R.fx         = W_RO; 

** La variation de stocks est exogene
 VSTK.fx(bns)   = VSTKO(bns);

** L'exportation de produits petroliers est exogene
 PL.fx('petr')  = PLO('petr');
 SNGO.fx        = SNGOO;
 
* --- EXECUTION DU MODELE ---
MODEL EXTER Economie ouverte avec gouvernement /ALL/;
EXTER.HOLDFIXED=1;
SOLVE EXTER USING CNS;

* =============================================================================
* --- AFFICHAGE DES VALEURS INITIALES (PARAMÈTRES O) ET NIVEAUX (.L) ---
* =============================================================================

* --- 1. VOLUMES ---
DISPLAY 
    CHO, CH.L, CIO, CI.L, CTH_reelO, CTH_reel.L, DDO, DD.L, 
    DIO, DI.L, DITO, DIT.L, DSO, DS.L, DXO, DX.L, EXO, EX.L, 
    FBCF_reelO, FBCF_reel.L, G_reelO, G_reel.L, IMO, IM.L, 
    INVO, INV.L, KDO, KD.L, KSO, KS.L, LDO, LD.L, LSO, LS.L, 
    MRGCOMO, MRGCOM.L, MRGTRPO, MRGTRP.L, PIB_MP_reelO, PIB_MP_reel.L, 
    PIB_BP_reelO, PIB_BP_reel.L, QO, Q.L, VAO, VA.L, VSTKO, VSTK.L, XSO, XS.L;

* --- 2. VALEURS NOMINALES ---
DISPLAY 
    CABO, CAB.L, CTHO, CTH.L, FBCFO, FBCF.L, GO, G.L, ITO, IT.L, 
    KD_RO, KD_R.L, LD_RO, LD_R.L, PIB_FDO, PIB_FD.L, PIB_IBO, PIB_IB.L, 
    PIB_MPO, PIB_MP.L, SFO, SF.L, SGO, SG.L, SHO, SH.L, SNGOO, SNGO.L, 
    SROWO, SROW.L, TDFO, TDF.L, TDHO, TDH.L, TIFO, TIF.L, TIMFO, TIMF.L, 
    TIMO, TIM.L, TIO, TI.L, TRAO, TRA.L, YDHO, YDH.L, YDFO, YDF.L, 
    YFKO, YFK.L, YFO, YF.L, YFTRAO, YFTRA.L, YGO, YG.L, YGTRAO, YGTRA.L, 
    YGTXO, YGTX.L, YHKO, YHK.L, YHLO, YHL.L, YHO, YH.L, YHTRAO, YHTRA.L, 
    YNGOO, YNGO.L, YROWKO, YROWK.L, YROWLO, YROWL.L, YROWO, YROW.L;

* --- 3. PRIX ---
DISPLAY 
    eO, e.L, PCO, PC.L, PCIO, PCI.L, PDO, PD.L, PEO, PE.L, 
    PIXCONO, PIXCON.L, PIXINVO, PIXINV.L, PLO, PL.L, PMO, PM.L, 
    PO, P.L, PPDO, PPD.L, PPMO, PPM.L, PVAO, PVA.L, PWEO, PWE.L, 
    PWMO, PWM.L, RO, R.L, R_RO, R_R.L, WO, W.L, W_RO, W_R.L, 
    PIXGDPO, PIXGDP.L;
    
display lambda_TRA;

$include EXter-Mada_resultats.gms