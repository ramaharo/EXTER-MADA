SET

SCEN Scenarios
/
 BASE            Valeurs initiales
 SIM             Valeurs apres choc
 VAR             Variation en poucentage
/
;

PARAMETER
    valCAB(scen)         "Solde du compte courant de la balance des paiements"
    valCH(tr,h,scen)     "Consommation finale du menage h en produit tr"
    valCH_nom(tr,h,scen) "Valeur nominale de la consommation finale du menage h en produit tr"
    valCI(i,scen)        "Consommation intermediaire totale de la branche j"
    valCI_nom(i,scen)    "Valeur nominale de la consommation intermediaire totale de la branche j"
    valCOMBAL(scen)      "Solde de la balance commerciale"
    valCTH(h,scen)       "Budget total de consommation du menage h"
    valCTH_reel(h,scen)  "Consommation totale reelle du menage h (deflatee)"
    valDD(tr,scen)       "Demande interieure pour le produit local tr"
    valDI(tr,i,scen)     "Consommation intermediaire en produit tr de la branche j"
    valDI_nom(tr,i,scen) "Valeur nominale de la consommation intermediaire en produit tr de la branche j"
    valDIT(tr,scen)      "Demande intermediaire totale pour le produit tr"
    valDON(scen)         "Recettes des dons extérieurs reçus par le gouvernement"
    valDOUANE(scen)      "Recettes totales des droits de douane"
    valDS(tr,trj,scen)    "Offre de produit tr par la branche trj sur le marche local"
    valDX(trj,scen)       "Production de la branche trj destinee au marche local"
    vale(scen)           "Taux de change nominal (monnaie locale par unite de devise)"
    valEX(tr,scen)       "Volume des exportations du produit tr"
    valEX_nom(tr,scen)   "Valeur nominale des exportations du produit tr"
    valEXTOT(scen)       "Valeur totale des exportations"
    valFBCF(scen)        "Formation brute de capital fixe (Volume)"
    valFBCF_reel(scen)   "Formation brute de capital fixe reelle"
    valFROWK(scen)       "Flux de capitaux lies au capital (RDM)"
    valFROWL(scen)       "Flux de capitaux lies au travail (RDM)"
    valG(ntr,scen)       "Depenses publiques de consommation finale (Administrations publiques)"
    valG_reel(ntr,scen)  "Depenses publiques de consommation finale reelle"
    valGTOT(scen)        "Depenses totales du gouvernement"
    valGTR(scen)         "Total des transferts verses par le gouvernement"
    valIM(tr,scen)       "Volume des importations du produit tr"
    valIM_nom(tr,scen)   "Valeur nominale des importations du produit tr"
    valIMPOT(scen)       "Recettes totales des impots directs et indirects"
    valIMTOT(scen)       "Valeur totale des importations"
    valINDTX(scen)       "Recettes totales des impots indirects"
    valINTD(scen)        "Service de l'interet sur la dette publique interieure"
    valINTF(scen)        "Service de l'interet sur la dette publique exterieure"
    valINV(tr,scen)      "Demande finale en produit tr pour l'investissement"
    valINV_nom(tr,scen)  "Valeur nominale de l'investissement en produit tr"
    valIT(scen)          "Investissement total (FBCF et variation de stocks)"
    valKD(tr,scen)       "Demande de capital de la branche tr"
    valKD_nom(tr,scen)   "Valeur nominale du stock de capital de la branche tr"
    valKD_R(scen)        "Revenus du capital verses par le reste du monde (RDM)"
    valKS(trj,scen)       "Offre de capital a la branche tr"
    valLD(i,scen)        "Demande de travail de la branche j"
    valLD_nom(i,scen)    "Valeur nominale de la masse salariale de la branche j"
    valLD_R(scen)        "Revenus du travail verses par le RDM"
    valLEON(scen)        "Variable de bouclage (Equilibre du marche des services - Loi de Walras)"
    valLS(scen)          "Offre totale de travail de l'economie"
    valMRGCOM(bns,scen)  "Volume des services de marge commerciale pour le produit bns"
    valMRGTRP(bns,scen)  "Volume des services de marge de transport pour le produit bns"
    valNTXF(scen)        "Recettes non fiscales provenant des Societes"
    valNTXH(h,scen)      "Recettes non fiscales provenant du menage h"
    valNTXHH(agpub,scen) "Recettes non fiscales provenant des menages a  agent agpub"
    valP(i,scen)         "Prix de la production (prix au producteur) de la branche j"
    valPC(tr,scen)       "Prix du produit composite tr (incluant taxes et marges)"
    valPCI(j,scen)       "Indice du prix du panier de consommation intermediaire de la branche j"
    valPD(tr,scen)       "Prix du produit local tr (toutes taxes et marges comprises)"
    valPE(tr,scen)       "Prix du produit exporte tr en monnaie locale (prix FOB)"
    valPIB_BP(scen)      "PIB aux prix de base"
    valPIB_FD(scen)      "PIB par l'approche de la demande finale"
    valPIB_IB(scen)      "PIB par l'approche des revenus"
    valPIB_MP(scen)      "PIB aux prix du marche"
    valPIB_MP_reel(scen) "PIB reel aux prix du marche"
    valPIB_BP_reel(scen) "PIB reel aux prix de base"
    valPIXGDP(scen)      "Indice general des prix (deflateur du PIB)"
    valPIXCON(scen)      "Indice des prix a la consommation"
    valPIXINV(scen)      "Indice des prix de l'investissement"
    valPL(tr,scen)       "Prix de la production locale du produit tr hors taxes indirectes"
    valPM(tr,scen)       "Prix du produit importe tr (toutes taxes droits et marges compris)"
    valPPD(tr,scen)      "Prix du produit local tr incluant les taxes indirectes (hors marges)"
    valPPM(tr,scen)      "Prix du produit importe tr incluant les droits et taxes (hors marges)"
    valPVA(j,scen)       "Prix de la valeur ajoutee de la branche j"
    valPWE(tr,scen)      "Prix mondial des exportations du produit tr (en devises)"
    valPWM(tr,scen)      "Prix mondial des importations du produit tr (en devises prix CAF)"
    valQ(tr,scen)        "Volume de la demande en produit composite tr"
    valR(tr,scen)        "Taux de rendement du capital dans la branche tr"
    valR_R(scen)         "Taux de rendement du capital a l'etranger (en devises)"
    valRNF(scen)         "Recettes non fiscales totales"
    valSF(scen)          "Epargne brute des entreprises"
    valSG(scen)          "Epargne brute de l'Administration centrale"
    valSH(h,scen)        "Epargne brute du menage h"
    valSNGO(scen)        "Epargne des autres administrations publiques et des ISBLSM"
    valSROW(scen)        "Epargne du reste du monde (equivalent au deficit courant)"
    valTDF(scen)         "Recettes des impots directs sur le revenu des entreprises"
    valTDH(h,scen)       "Recettes des impots directs sur le revenu du menage h"
    valTI(tr,scen)       "Recettes des taxes indirectes sur le produit tr"
    valTIF(scen)         "Recettes des autres taxes indirectes a la charge des entreprises"
    valTIM(tr,scen)      "Recettes des droits de douane sur le produit tr"
    valTIMF(scen)        "Autres droits et tarifs douaniers verses par les entreprises"
    valTIMTOT(scen)      "Total des droits de douane percus"
    valTITOT(scen)       "Total des taxes indirectes perçues"
    valTPROD(scen)       "Recettes des taxes sur la production"
    valTRF_NG(scen)      "Transferts des autres APU et ISBLSM vers les entreprises"
    valTRA(ag,agj,scen)  "Transferts nets du RDM vers les entreprises"
    valTRTOT(scen)       "Total des transferts de revenus dans l'economie"
    valVA(i,scen)        "Valeur ajoutee reelle de la branche j"
    valVA_nom(i,scen)    "Valeur ajoutee nominale de la branche j"
    valVSTK(bns,scen)    "Variation des stocks du produit bns (Volume)"
    valVSTK_nom(bns,scen) "Valeur nominale de la variation des stocks du produit bns"
    valW(scen)           "Taux de salaire nominal moyen"
    valW_R(scen)         "Taux de salaire international (en devises)"
    valXS(i,scen)        "Production totale en volume de la branche j"
    valXS_nom(i,scen)    "Valeur nominale de la production de la branche j"
    valYDH(h,scen)       "Revenu disponible du menage h"
    valYF(scen)          "Revenu total des entreprises"
    valYDF(scen)         "Revenu disponible des entreprises"
    valYFK(scen)         "Revenu du capital percu par les entreprises"
    valYG(scen)          "Revenu total de l'Administration centrale"
    valYGTRA(scen)       "Revenus non fiscaux du gouvernement"
    valYGTX(scen)        "Revenus fiscaux du gouvernement"
    valYGNTX(scen)       "Revenus non fiscaux du gouvernement"
    valYH(h,scen)        "Revenu total du menage h"
    valYHK(h,scen)       "Revenu du capital percu par le menage h"
    valYHL(h,scen)       "Revenu du travail (salaires) du menage h"
    valYHTRA(h,scen)     "Revenu de transfert du menage h"
    valYNGO(scen)        "Revenu des autres APU et des ISBLSM"
    valYROW(scen)        "Revenu du reste du monde (en monnaie locale)"
    valYROWK(scen)       "Revenu du capital du reste du monde"
    valYROWL(scen)       "Revenu du travail du reste du monde"
;

* --- Assignation des valeurs de référence au scénario 'base' ---

valCAB('base')          = CABO;
valCH(tr,h,'base')      = CHO(tr,h);
valCH_nom(tr,h,'base')  = PCO(tr)*CHO(tr,h);
valCI(j,'base')         = CIO(j);
valCI_nom(j,'base')     = PCIO(j)*CIO(j);
valCTH(h,'base')        = CTHO(h);
valCTH_reel(h,'base')   = CTH_reelO(h);
valDD(tr,'base')        = DDO(tr);
valDI(tr,j,'base')      = DIO(tr,j);
valDI_nom(tr,j,'base')  = DIO(tr,j)*PCO(tr);
valDIT(tr,'base')       = DITO(tr);
valDS(tr,trj,'base')    = DSO(tr,trj);
valDX(trj,'base')       = DXO(trj);
vale('base')            = eO;
valEX(tr,'base')        = EXO(tr);
valEX_nom(tr,'base')    = PEO(tr)*EXO(tr);
valEXTOT('base')        = SUM[tr, PEO(tr)*EXO(tr)];
valFBCF('base')         = FBCFO;
valFBCF_reel('base')    = FBCF_reelO;
valFROWK('base')        = eO*R_RO*KD_RO;
valFROWL('base')        = eO*W_RO*LD_RO;
valG(ntr,'base')        = GO(ntr);
valG_reel(ntr,'base')   = G_reelO(ntr);
valIM(tr,'base')        = IMO(tr);
valIM_nom(tr,'base')    = PMO(tr)*IMO(tr);
valIMTOT('base')        = SUM(tr, PMO(tr)*IMO(tr));
valINV(tr,'base')       = INVO(tr);
valINV_nom(tr,'base')   = PCO(tr)*INVO(tr);
valIT('base')           = ITO;
valKD(trj,'base')       = KDO(trj);
valKD_nom(trj,'base')   = RO(trj)*KDO(trj);
valKD_R('base')         = KD_RO;
valKS(trj,'base')       = KSO(trj);
valLD(j,'base')         = LDO(j);
valLD_nom(j,'base')     = WO*LDO(j);
valLD_R('base')         = LD_RO;
valLEON('base')         = QO('ser') - SUM[h, CHO('ser',h)]  - DITO('ser')
                          - SUM[bns, MRGCOMO(bns)] - SUM[bns, MRGTRPO(bns)]
                          - INVO('ser');
valLS('base')           = LSO;
valMRGCOM(bns,'base')   = MRGCOMO(bns);
valMRGTRP(bns,'base')   = MRGTRPO(bns);
valNTXF('base')         = NTXFO;
valNTXH(h,'base')       = NTXHO(h);
valNTXHH(agpub,'base')  = NTXHHO(agpub);
valP(i,'base')          = PO(i);
valPC(tr,'base')        = PCO(tr);
valPCI(j,'base')        = PCIO(j);
valPD(tr,'base')        = PDO(tr);
valPE(tr,'base')        = PEO(tr);
valPIB_BP('base')       = PIB_BPO;
valPIB_FD('base')       = PIB_FDO;
valPIB_IB('base')       = PIB_IBO;
valPIB_MP('base')       = PIB_MPO;
valPIB_MP_reel('base')  = PIB_MP_reelO;
valPIB_BP_reel('base')  = PIB_BP_reelO;
valPIXGDP('base')       = PIXGDPO;
valPIXCON('base')       = PIXCONO;
valPIXINV('base')       = PIXINVO;
valPL(tr,'base')        = PLO(tr);
valPM(tr,'base')        = PMO(tr);
valPPD(tr,'base')       = PPDO(tr);
valPPM(tr,'base')       = PPMO(tr);
valPVA(j,'base')        = PVAO(j);
valPWE(tr,'base')       = PWEO(tr);
valPWM(tr,'base')       = PWMO(tr);
valQ(tr,'base')         = QO(tr);
valR(trj,'base')        = RO(trj);
valR_R('base')          = R_RO;
valSF('base')           = SFO;
valSG('base')           = SGO;
valSH(h,'base')         = SHO(h);
valSNGO('base')         = SNGOO;
valSROW('base')         = SROWO;
valTDF('base')          = TDFO;
valTDH(h,'base')        = TDHO(h);
valTI(tr,'base')        = TIO(tr);
valTIF('base')          = TIFO;
valTIM(tr,'base')       = TIMO(tr);
valTIMF('base')         = TIMFO;
valTRA(ag,agj,'base')   = TRAO(ag,agj);
valVA(j,'base')         = VAO(j);
valVA_nom(j,'base')     = PVAO(j)*VAO(j);
valVSTK(bns,'base')     = VSTKO(bns);
valVSTK_nom(bns,'base') = PCO(bns)*VSTKO(bns);
valW('base')            = WO;
valW_R('base')          = W_RO;
valXS(j,'base')         = XSO(j);
valXS_nom(j,'base')     = PO(j)*XSO(j);
valYDH(h,'base')        = YDHO(h);
valYDF('base')          = YDFO;
valYF('base')           = YFO;
valYFK('base')          = YFKO;
valYG('base')           = YGO;
valYGTRA('base')        = YGTRAO;
valYGTX('base')         = YGTXO;
valYGNTX('base')         = YGNTXO;
valYH(h,'base')         = YHO(h);
valYHK(h,'base')        = YHKO(h);
valYHL(h,'base')        = YHLO(h);
valYHTRA(h,'base')      = YHTRAO(h);
valYNGO('base')         = YNGOO;
valYROW('base')         = YROWO;
valYROWK('base')        = YROWKO;
valYROWL('base')        = YROWLO;


* --- Assignation des valeurs après simulation au scénario 'sim' ---
valCAB('sim')          = CAB.l;
valCH(tr,h,'sim')      = CH.l(tr,h);
valCH_nom(tr,h,'sim')  = PC.l(tr)*CH.l(tr,h);
valCI(j,'sim')         = CI.l(j);
valCI_nom(j,'sim')     = PCI.l(j)*CI.l(j);
valCTH(h,'sim')        = CTH.l(h);
valCTH_reel(h,'sim')   = CTH_reel.l(h);
valDD(tr,'sim')        = DD.l(tr);
valDI(tr,j,'sim')      = DI.l(tr,j);
valDI_nom(tr,j,'sim')  = DI.l(tr,j)*PC.l(tr);
valDIT(tr,'sim')       = DIT.l(tr);
valDS(tr,trj,'sim')    = DS.l(tr,trj);
valDX(trj,'sim')       = DX.l(trj);
vale('sim')            = e.l;
valEX(tr,'sim')        = EX.l(tr);
valEX_nom(tr,'sim')    = PE.l(tr)*EX.l(tr);
valEXTOT('sim')        = SUM(tr, PE.l(tr)*EX.l(tr));
valFBCF('sim')         = FBCF.l;
valFBCF_reel('sim')    = FBCF_reel.l;
valFROWK('sim')        = e.l*R_R.l*KD_R.l;
valFROWL('sim')        = e.l*W_R.l*LD_R.l;
valG(ntr,'sim')        = G.l(ntr);
valG_reel(ntr,'sim')   = G_reel.l(ntr);
valIM(tr,'sim')        = IM.l(tr);
valIM_nom(tr,'sim')    = PM.l(tr)*IM.l(tr);
valIMTOT('sim')        = SUM[tr, PM.l(tr)*IM.l(tr)];
valINV(tr,'sim')       = INV.l(tr);
valINV_nom(tr,'sim')   = PC.l(tr)*INV.l(tr);
valIT('sim')           = IT.l;
valKD(trj,'sim')       = KD.l(trj);
valKD_nom(trj,'sim')   = R.l(trj)*KD.l(trj);
valKD_R('sim')         = KD_R.l;
valKS(trj,'sim')       = KS.l(trj);
valLD(j,'sim')         = LD.l(j);
valLD_nom(j,'sim')     = W.l*LD.l(j);
valLD_R('sim')         = LD_R.l;
valLEON('sim')         = LEON.l;
valLS('sim')           = LS.l;
valMRGCOM(bns,'sim')   = MRGCOM.l(bns);
valMRGTRP(bns,'sim')   = MRGTRP.l(bns);
valNTXF('sim')         = NTXF.l;
valNTXH(h,'sim')       = NTXH.l(h);
valNTXHH(agpub,'sim')  = NTXHH.l(agpub);
valP(j,'sim')          = P.l(j);
valPC(tr,'sim')        = PC.l(tr);
valPCI(j,'sim')        = PCI.l(j);
valPD(tr,'sim')        = PD.l(tr);
valPE(tr,'sim')        = PE.l(tr);
valPIB_BP('sim')       = PIB_BP.l;
valPIB_FD('sim')       = PIB_FD.l;
valPIB_IB('sim')       = PIB_IB.l;
valPIB_MP('sim')       = PIB_MP.l;
valPIB_MP_reel('sim')  = PIB_MP_reel.l;
valPIB_BP_reel('sim')  = PIB_BP_reel.l;
valPIXGDP('sim')       = PIXGDP.l;
valPIXCON('sim')       = PIXCON.l;
valPIXINV('sim')       = PIXINV.l;
valPL(tr,'sim')        = PL.l(tr);
valPM(tr,'sim')        = PM.l(tr);
valPPD(tr,'sim')       = PPD.l(tr);
valPPM(tr,'sim')       = PPM.l(tr);
valPVA(j,'sim')        = PVA.l(j);
valPWE(tr,'sim')       = PWE.l(tr);
valPWM(tr,'sim')       = PWM.l(tr);
valQ(tr,'sim')         = Q.l(tr);
valR(trj,'sim')         = R.l(trj);
valR_R('sim')          = R_R.l;
valSF('sim')           = SF.l;
valSG('sim')           = SG.l;
valSH(h,'sim')         = SH.l(h);
valSNGO('sim')         = SNGO.l;
valSROW('sim')         = SROW.l;
valTDF('sim')          = TDF.l;
valTDH(h,'sim')        = TDH.l(h);
valTI(tr,'sim')        = TI.l(tr);
valTIF('sim')          = TIF.l;
valTIM(tr,'sim')       = TIM.l(tr);
valTIMF('sim')         = TIMF.l;
valTIMTOT('sim')       = SUM(tr, TIM.l(tr));
valTITOT('sim')        = SUM(tr, TI.l(tr));
valTPROD('sim')        = SUM(tr, TI.l(tr) + TIM.l(tr));
valTRA(ag,agj,'sim')$TRAO(ag,agj) = TRA.l(ag,agj);
valVA(j,'sim')         = VA.l(j);
valVA_nom(j,'sim')     = PVA.l(j)*VA.l(j);
valVSTK(bns,'sim')     = VSTK.l(bns);
valVSTK_nom(bns,'sim') = PC.l(bns)*VSTK.l(bns);
valW('sim')            = W.l;
valW_R('sim')          = W_R.l;
valXS(j,'sim')         = XS.l(j);
valXS_nom(j,'sim')     = P.l(j)*XS.l(j);
valYDH(h,'sim')        = YDH.l(h);
valYDF('sim')          = YDF.l;
valYF('sim')           = YF.l;
valYFK('sim')          = YFK.l;
valYG('sim')           = YG.l;
valYGTRA('sim')        = YGTRA.l;
valYGTX('sim')         = YGTX.l;
valYGNTX('sim')        = YGNTX.l;
valYH(h,'sim')         = YH.l(h);
valYHK(h,'sim')        = YHK.l(h);
valYHL(h,'sim')        = YHL.l(h);
valYHTRA(h,'sim')      = YHTRA.l(h);
valYNGO('sim')         = YNGO.l;
valYROW('sim')         = YROW.l;
valYROWK('sim')        = YROWK.l;
valYROWL('sim')        = YROWL.l;

display valTRA, TRAO;
* --- Calcul des variations en pourcentage (%) pour le scénario 'var' ---
valCAB('var')           $valCAB('base')                = (valCAB('sim')         / valCAB('base') - 1) * 100;
valCH(tr,h,'var')       $valCH(tr,h,'base')            = (valCH(tr,h,'sim')     / valCH(tr,h,'base') - 1) * 100;
valCH_nom(tr,h,'var')   $valCH_nom(tr,h,'base')        = (valCH_nom(tr,h,'sim') / valCH_nom(tr,h,'base') - 1) * 100;
valCI(j,'var')          $valCI(j,'base')               = (valCI(j,'sim')        / valCI(j,'base') - 1) * 100;
valCI_nom(j,'var')$valCI_nom(j,'base')                 = (valCI_nom(j,'sim')    / valCI_nom(j,'base') - 1) * 100;
valCTH(h,'var')$valCTH(h,'base')                       = (valCTH(h,'sim')       / valCTH(h,'base') - 1) * 100;
valCTH_reel(h,'var')$valCTH_reel(h,'base')             = (valCTH_reel(h,'sim')  / valCTH_reel(h,'base') - 1) * 100;
valDD(tr,'var')$valDD(tr,'base')                       = (valDD(tr,'sim')       / valDD(tr,'base') - 1) * 100;
valDI(tr,j,'var')$valDI(tr,j,'base')                   = (valDI(tr,j,'sim')     / valDI(tr,j,'base') - 1) * 100;
valDI_nom(tr,j,'var')$valDI_nom(tr,j,'base')           = (valDI_nom(tr,j,'sim') / valDI_nom(tr,j,'base') - 1) * 100;
valDIT(tr,'var')$valDIT(tr,'base')                     = (valDIT(tr,'sim')      / valDIT(tr,'base') - 1) * 100;
valDS(tr,trj,'var')$valDS(tr,trj,'base')               = (valDS(tr,trj,'sim')   / valDS(tr,trj,'base') - 1) * 100;
valDX(trj,'var')$valDX(trj,'base')                     = (valDX(trj,'sim')      / valDX(trj,'base') - 1) * 100;
vale('var')$vale('base')                               = (vale('sim')           / vale('base') - 1) * 100;
valEX(tr,'var')$valEX(tr,'base')                       = (valEX(tr,'sim')       / valEX(tr,'base') - 1) * 100;
valEX_nom(tr,'var')$valEX_nom(tr,'base')               = (valEX_nom(tr,'sim')   / valEX_nom(tr,'base') - 1) * 100;
valEXTOT('var')$valEXTOT('base')                       = (valEXTOT('sim')       / valEXTOT('base') - 1) * 100;
valFBCF('var')$valFBCF('base')                         = (valFBCF('sim')        / valFBCF('base') - 1) * 100;
valFBCF_reel('var')$valFBCF_reel('base')               = (valFBCF_reel('sim')   / valFBCF_reel('base') - 1) * 100;
valFROWK('var')$valFROWK('base')                       = (valFROWK('sim')       / valFROWK('base') - 1) * 100;
valFROWL('var')$valFROWL('base')                       = (valFROWL('sim')       / valFROWL('base') - 1) * 100;
valG(ntr,'var')$valG(ntr,'base')                       = (valG(ntr,'sim')       / valG(ntr,'base') - 1) * 100;
valG_reel(ntr,'var')$valG_reel(ntr,'base')             = (valG_reel(ntr,'sim')  / valG_reel(ntr,'base') - 1) * 100;
valIM(tr,'var')$valIM(tr,'base')                       = (valIM(tr,'sim')       / valIM(tr,'base') - 1) * 100;
valIM_nom(tr,'var')$valIM_nom(tr,'base')               = (valIM_nom(tr,'sim')   / valIM_nom(tr,'base') - 1) * 100;
valIMTOT('var')$valIMTOT('base')                       = (valIMTOT('sim')       / valIMTOT('base') - 1) * 100;
valINV(tr,'var')$valINV(tr,'base')                     = (valINV(tr,'sim')      / valINV(tr,'base') - 1) * 100;
valINV_nom(tr,'var')$valINV_nom(tr,'base')             = (valINV_nom(tr,'sim')  / valINV_nom(tr,'base') - 1) * 100;
valIT('var')$valIT('base')                             = (valIT('sim')          / valIT('base') - 1) * 100;
valKD(tr,'var')$valKD(tr,'base')                       = (valKD(tr,'sim')       / valKD(tr,'base') - 1) * 100;
valKD_nom(tr,'var')$valKD_nom(tr,'base')               = (valKD_nom(tr,'sim')   / valKD_nom(tr,'base') - 1) * 100;
valKD_R('var')$valKD_R('base')                         = (valKD_R('sim')        / valKD_R('base') - 1) * 100;
valKS(trj,'var')$valKS(trj,'base')                     = (valKS(trj,'sim')      / valKS(trj,'base') - 1) * 100;
valLD(j,'var')$valLD(j,'base')                         = (valLD(j,'sim')        / valLD(j,'base') - 1) * 100;
valLD_nom(j,'var')$valLD_nom(j,'base')                 = (valLD_nom(j,'sim')    / valLD_nom(j,'base') - 1) * 100;
valLD_R('var')$valLD_R('base')                         = (valLD_R('sim')        / valLD_R('base') - 1) * 100;
valLS('var')$valLS('base')                             = (valLS('sim')          / valLS('base') - 1) * 100;
valMRGCOM(bns,'var')$valMRGCOM(bns,'base')             = (valMRGCOM(bns,'sim')  / valMRGCOM(bns,'base') - 1) * 100;
valMRGTRP(bns,'var')$valMRGTRP(bns,'base')             = (valMRGTRP(bns,'sim')  / valMRGTRP(bns,'base') - 1) * 100;
valNTXF('var')$valNTXF('base')                         = (valNTXF('sim')        / valNTXF('base') - 1) * 100;
valNTXH(h,'var')$valNTXH(h,'base')                     = (valNTXH(h,'sim')      / valNTXH(h,'base') - 1) * 100;
valNTXHH(agpub,'var')$valNTXHH(agpub,'base')           = (valNTXHH(agpub,'sim') / valNTXHH(agpub,'base') - 1) * 100;
valP(j,'var')$valP(j,'base')                           = (valP(j,'sim')         / valP(j,'base') - 1) * 100;
valPC(tr,'var')$valPC(tr,'base')                       = (valPC(tr,'sim')       / valPC(tr,'base') - 1) * 100;
valPCI(j,'var')$valPCI(j,'base')                       = (valPCI(j,'sim')       / valPCI(j,'base') - 1) * 100;
valPD(tr,'var')$valPD(tr,'base')                       = (valPD(tr,'sim')       / valPD(tr,'base') - 1) * 100;
valPE(tr,'var')$valPE(tr,'base')                       = (valPE(tr,'sim') / valPE(tr,'base') - 1) * 100;
valPIB_BP('var')$valPIB_BP('base')                     = (valPIB_BP('sim') / valPIB_BP('base') - 1) * 100;
valPIB_FD('var')$valPIB_FD('base')                     = (valPIB_FD('sim') / valPIB_FD('base') - 1) * 100;
valPIB_IB('var')$valPIB_IB('base')                     = (valPIB_IB('sim') / valPIB_IB('base') - 1) * 100;
valPIB_MP('var')$valPIB_MP('base')                     = (valPIB_MP('sim') / valPIB_MP('base') - 1) * 100;
valPIB_MP_reel('var')$valPIB_MP_reel('base')           = (valPIB_MP_reel('sim') / valPIB_MP_reel('base') - 1) * 100;
valPIB_BP_reel('var')$valPIB_BP_reel('base')           = (valPIB_BP_reel('sim') / valPIB_BP_reel('base') - 1) * 100;
valPIXGDP('var')$valPIXGDP('base')                     = (valPIXGDP('sim') / valPIXGDP('base') - 1) * 100;
valPIXCON('var')$valPIXCON('base')                     = (valPIXCON('sim') / valPIXCON('base') - 1) * 100;
valPIXINV('var')$valPIXINV('base')                     = (valPIXINV('sim') / valPIXINV('base') - 1) * 100;
valPL(tr,'var')$valPL(tr,'base')                       = (valPL(tr,'sim') / valPL(tr,'base') - 1) * 100;
valPM(tr,'var')$valPM(tr,'base')                       = (valPM(tr,'sim') / valPM(tr,'base') - 1) * 100;
valPPD(tr,'var')$valPPD(tr,'base')                     = (valPPD(tr,'sim') / valPPD(tr,'base') - 1) * 100;
valPPM(tr,'var')$valPPM(tr,'base')                     = (valPPM(tr,'sim') / valPPM(tr,'base') - 1) * 100;
valPVA(j,'var')$valPVA(j,'base')                       = (valPVA(j,'sim') / valPVA(j,'base') - 1) * 100;
valPWE(tr,'var')$valPWE(tr,'base')                     = (valPWE(tr,'sim') / valPWE(tr,'base') - 1) * 100;
valPWM(tr,'var')$valPWM(tr,'base')                     = (valPWM(tr,'sim') / valPWM(tr,'base') - 1) * 100;
valQ(tr,'var')$valQ(tr,'base')                         = (valQ(tr,'sim') / valQ(tr,'base') - 1) * 100;
valR(trj,'var')$valR(trj,'base')                       = (valR(trj,'sim') / valR(trj,'base') - 1) * 100;
valR_R('var')$valR_R('base')                           = (valR_R('sim') / valR_R('base') - 1) * 100;
valSF('var')$valSF('base')                             = (valSF('sim') / valSF('base') - 1) * 100;
valSG('var')$valSG('base')                             = (valSG('sim') / valSG('base') - 1) * 100;
valSH(h,'var')$valSH(h,'base')                         = (valSH(h,'sim') / valSH(h,'base') - 1) * 100;
valSNGO('var')$valSNGO('base')                         = (valSNGO('sim') / valSNGO('base') - 1) * 100;
valSROW('var')$valSROW('base')                         = (valSROW('sim') / valSROW('base') - 1) * 100;
valTDH(h,'var')$valTDH(h,'base')                       = (valTDH(h,'sim') / valTDH(h,'base') - 1) * 100;
valTDF('var')$valTDF('base')                           = (valTDF('sim') / valTDF('base') - 1) * 100;
valTI(tr,'var')$valTI(tr,'base')                       = (valTI(tr,'sim') / valTI(tr,'base') - 1) * 100;
valTIF('var')$valTIF('base')                           = (valTIF('sim') / valTIF('base') - 1) * 100;
valTIM(tr,'var')$valTIM(tr,'base')                     = (valTIM(tr,'sim') / valTIM(tr,'base') - 1) * 100;
valTIMF('var')$valTIMF('base')                         = (valTIMF('sim') / valTIMF('base') - 1) * 100;
valTRA(ag,agj,'var')$valTRA(ag,agj,'base')             = (valTRA(ag,agj,'sim') / valTRA(ag,agj,'base') - 1) * 100;
valVA(j,'var')$valVA(j,'base')                         = (valVA(j,'sim') / valVA(j,'base') - 1) * 100;
valVA_nom(j,'var')$valVA_nom(j,'base')                 = (valVA_nom(j,'sim') / valVA_nom(j,'base') - 1) * 100;
valVSTK(bns,'var')$valVSTK(bns,'base')                 = (valVSTK(bns,'sim') / valVSTK(bns,'base') - 1) * 100;
valVSTK_nom(bns,'var')$valVSTK_nom(bns,'base')         = (valVSTK_nom(bns,'sim') / valVSTK_nom(bns,'base') - 1) * 100;
valW('var')$valW('base')                               = (valW('sim') / valW('base') - 1) * 100;
valW_R('var')$valW_R('base')                           = (valW_R('sim') / valW_R('base') - 1) * 100;
valXS(j,'var')$valXS(j,'base')                         = (valXS(j,'sim') / valXS(j,'base') - 1) * 100;
valXS_nom(j,'var')$valXS_nom(j,'base')                 = (valXS_nom(j,'sim') / valXS_nom(j,'base') - 1) * 100;
valYDH(h,'var')$valYDH(h,'base')                       = (valYDH(h,'sim') / valYDH(h,'base') - 1) * 100;
valYF('var')$valYF('base')                             = (valYF('sim') / valYF('base') - 1) * 100;
valYFK('var')$valYFK('base')                           = (valYFK('sim') / valYFK('base') - 1) * 100;
valYG('var')$valYG('base')                             = (valYG('sim') / valYG('base') - 1) * 100;
valYGTX('var')$valYGTX('base')                         = (valYGTX('sim') / valYGTX('base') - 1) * 100;
valYGNTX('var')$valYGNTX('base')                       = (valYGNTX('sim') / valYGNTX('base') - 1) * 100;
valYGTRA('var')$valYGTRA('base')                       = (valYGTRA('sim') / valYGTRA('base') - 1) * 100;
valYH(h,'var')$valYH(h,'base')                         = (valYH(h,'sim') / valYH(h,'base') - 1) * 100;
valYHK(h,'var')$valYHK(h,'base')                       = (valYHK(h,'sim') / valYHK(h,'base') - 1) * 100;
valYHL(h,'var')$valYHL(h,'base')                       = (valYHL(h,'sim') / valYHL(h,'base') - 1) * 100;
valYHTRA(h,'var')$valYHTRA(h,'base')                   = (valYHTRA(h,'sim') / valYHTRA(h,'base') - 1) * 100;
valYNGO('var')$valYNGO('base')                         = (valYNGO('sim') / valYNGO('base') - 1) * 100;
valYROW('var')$valYROW('base')                         = (valYROW('sim') / valYROW('base') - 1) * 100;
valYROWK('var')$valYROWK('base')                       = (valYROWK('sim') / valYROWK('base') - 1) * 100;
valYROWL('var')$valYROWL('base')                       = (valYROWL('sim') / valYROWL('base') - 1) * 100;
*$onText
execute_unload "Results",
    valCAB,         valCH,          valCH_nom,      valCI,          valCI_nom,      
    valCTH,         valCTH_reel,    valDD,          valDI,          valDI_nom,      
    valDIT,         valDS,          valDX,          vale,           
    valEX,          valEX_nom,      valEXTOT,       valFBCF,        valFBCF_reel,   
    valFROWK,       valFROWL,       valG,           valG_reel,      valIM,          
    valIM_nom,      valIMTOT,       valINV,         valINV_nom,     valIT,          
    valKD,          valKD_nom,      valKD_R,        valKS,          valLD,          
    valLD_nom,      valLD_R,        valLS,          valMRGCOM,      valMRGTRP,
    valNTXF,        valNTXH,        valNTXHH,
    valP,           valPC,          valPCI,         valPD,          valPE,          
    valPIB_BP,      valPIB_FD,      valPIB_IB,      valPIB_MP,      valPIB_MP_reel, 
    valPIB_BP_reel, valPIXGDP,      valPIXCON,      valPIXINV,      valPL,          
    valPM,          valPPD,         valPPM,         valPVA,         valPWE,         
    valPWM,         valQ,           valR,           valR_R,         valSF,          
    valSG,          valSH,          valSNGO,        valSROW,        valTI,          
    valTIF,         valTIM,         valTIMF,        valTRA,         valVA,          
    valVA_nom,      valVSTK,        valVSTK_nom,    valW,           valW_R,         
    valXS,          valXS_nom,      valYDH,         valYF,          valYFK,         
    valYG,          valYGTX,        valYGNTX,       valYH,          valYHK,         valYHL,         
    valYHTRA,       valYNGO,        valYROW,        valYROWK,       valYROWL;

execute '=gdx2xls results.gdx';


execute_unload "Parameters",
    A,              A_E,            A_M,            aij,            alpha,          
    beta_E,         beta_M,         eta,            gamma_CH,       
    gamma_INV,      io,             lambda,         lambda_R,       lambda_TRA,
    ntyf,           ntyh,           sntx,
    phi,            psi,            rho_E,          rho_M,          sigma_E,        
    sigma_M,        syfi,           syfm,           theta,          tm,             
    tmgc,           tmgt,           tx,             tyf,            tyh,            
    v;


execute '=gdx2xls parameters.gdx';

*$offText

* --- Configuration du fichier de sortie ---
FILE REPCMP /RESULTATS_COMPLETSv10.0.TXT/;
REPCMP.PW = 160;
PUT REPCMP;


PUT "RAPPORT ANALYTIQUE : COMPARAISON DES SCENARIOS" //;
PUT  @ 2 'DATE:'SYSTEM.DATE      @ 40 'HEURE:' SYSTEM.TIME///;
PUT "DESCRIPTION" @55 "SYMBOLE" @90 "BASE":>10:3 @105 "SIMULATIOM":>10:3 @120"VARIATION (%)":>10:3 /;
PUT "=================================================================================================================================" //;
PUT @2 "EQUILIBRE (LOI DE WALRAS)"              @55 "LEON"                  @90 valLEON('base'):>10:3        @105 valLEON('sim'):>10:3  //;    
PUT "=================================================================================================================================" //;

PUT "COMPTE DES MENAGES" /;
LOOP(h,
   PUT @2 h.te(h) /;
   PUT @4 "Ressources/Emplois totals"           @55 "YH"                    @90 valYH(h,'base'):>10:3           @105 valYH(h,'sim'):>10:3           @120 valYH(h,'var'):>10:3 /;
   PUT /;
   
   PUT @4 "Ressources"                             /;
   PUT @6 "Revenus du Travail"                  @55 "YHL"                   @90 valYHL(h,'base'):>10:3          @105 valYHL(h,'sim'):>10:3          @120 valYHL(h,'var'):>10:3 /;
   PUT @6 "Revenus du Capital"                  @55 "YHK"                   @90 valYHK(h,'base'):>10:3          @105 valYHK(h,'sim'):>10:3          @120 valYHK(h,'var'):>10:3 /;
   PUT @6 "Transferts recus"                    @55 "YHTR"                  @90 valYHTRA(h,'base'):>10:3        @105 valYHTRA(h,'sim'):>10:3        @120 valYHTRA(h,'var'):>10:3 /;
   PUT /;
   
   PUT @4 "Emplois"                                /;
   PUT @6 "Impots sur le revenu"                @55 "TDH"                   @90 valTDH(h,'base'):>10:3          @105 valTDH(h,'sim'):>10:3          @120 valTDH(h,'var'):>10:3 /;
   PUT @6 "Prelevements non fiscaux"            @55 "NTXH(" h.TL:0 ")"      @90 valNTXH(h,'base'):>10:3         @105 valNTXH(h,'sim'):>10:3         @120 valNTXH(h,'var'):>10:3 /;
   PUT @6 "Consommation Finale"                 @55 "CTH"                   @90 valCTH(h,'base'):>10:3          @105 valCTH(h,'sim'):>10:3          @120 valCTH(h,'var'):>10:3 /; 
   PUT @6 "Epargne"                             @55 "SH"                    @90 valSH(h,'base'):>10:3           @105 valSH(h,'sim'):>10:3           @120 valSH(h,'var'):>10:3 /;
   PUT /;
);

PUT "=================================================================================================================================" //;

PUT "COMPTE DES SOCIETES" /;
PUT @4 "Ressources/Emplois totals"              @55 "YF"                    @90 valYF('base'):>10:3             @105 valYF('sim'):>10:3          @120 valYF('var'):>10:3 /;
PUT /;

PUT @4 "Ressources"     /;                          
PUT @6 "Transf. recus du RDM"                   @55 "TRA(firm,row)"         @90 valTRA('firm','row','base'):>10:3           @105 valTRA('firm','row','sim'):>10:3      @120 valTRA('firm','row','var'):>10:3 /;
PUT @6 "Transf. recus de l'Adm. centrale"       @55 "TRA(firm,gvt)"         @90 valTRA('firm','gvt','base'):>10:3           @105 valTRA('firm','gvt','sim'):>10:3      @120 valTRA('firm','gvt','var'):>10:3 /;
PUT @6 "Revenu du capital"                      @55 "YFK"                   @90 valYFK('base'):>10:3                        @105 valYFK('sim'):>10:3                   @120 valYFK('var'):>10:3 /;
PUT /;

PUT @4 "Emplois"      /;                         
PUT @6 "Impots sur le revenu"                   @55 "TDF"                   @90 valTDF('base'):>10:3            @105 valTDF('sim'):>10:3        @120 valTDF('var'):>10:3 /;
PUT @6 "Autres impots indirects"                @55 "TIF"                   @90 valTIF('base'):>10:3            @105 valTIF('sim'):>10:3        @120 valTIF('var'):>10:3 /;
PUT @6 "Autres droits de douanes"               @55 "TIMF"                  @90 valTIMF('base'):>10:3           @105 valTIMF('sim'):>10:3       @120 valTIMF('var'):>10:3 /;
PUT @6 "Prelevements fiscaux"                   @55 "NTXF"                  @90 valNTXF('base'):>10:3           @105 valNTXF('sim'):>10:3       @120 valNTXF('var'):>10:3 /;
PUT @6 "Transf. aux autres APU et ISBLSM"       @55 "TRA(ngo,firm)"         @90 valTRA('ngo','firm','base'):>10:3
                                                                                                                @105 valTRA('ngo','firm','sim'):>10:3
                                                                                                                                                @120 valTRA('ngo','firm','var'):>10:3 /;
LOOP(h,
    PUT @6 "Transf. aux "  h.TE(h)              @55 "TRA(" h.TL:0 ",firm)"  @90 valTRA(h,'firm','base'):>10:3
                                                                                                                @105 valTRA(h,'firm','sim'):>10:3
                                                                                                                                                @120 valTRA(h,'firm','var'):>10:3 /;
);                                                                                                                                                
PUT @6 "Epargne"                                @55 "SF"                   @90 valSF('base'):>10:3             @105 valSF('sim'):>10:3         @120 valSF('var'):>10:3 /;


PUT /;

PUT "=================================================================================================================================" //;

PUT "COMPTE DE l'ADMINISTRATION CENTRALE" /;
PUT @4"Ressources/Emplois total"                @55 "YG"                    @90 valYG('base'):>10:3             @105 valYG('sim'):>10:3             @120 valYG('var'):>10:3 /;
PUT /;
PUT @4 "Ressources"     /;
PUT @6 "Impots indirects "  /;           
LOOP(tr,
    PUT @8  tr.TE(tr)                           @55 "TI(" tr.TL:0 ")"       @90 valTI(tr,'base'):>10:3          @105 valTI(tr,'sim'):>10:3          @120 valTI(tr,'var'):>10:3 /;
);
PUT @8 "Autres impots indirects"                @55 "TIF"                   @90 valTIF('base'):>10:3            @105 valTIF('sim'):>10:3            @120 valTIF('var'):>10:3 /;
PUT /;

PUT @6 "Droits de douanes "   /;           
LOOP(tr,
    PUT @8 tr.TE(tr)                            @55 "TIM(" tr.TL:0 ")"      @90 valTIM(tr,'base'):>10:3         @105 valTIM(tr,'sim'):>10:3         @120 valTIM(tr,'var'):>10:3 /;
);
PUT @8 "Autres droits de douanes"               @55 "TIMF"                  @90 valTIMF('base'):>10:3           @105 valTIMF('sim'):>10:3           @120 valTIMF('var'):>10:3 /;
PUT /;

PUT @6 "Impot sur le revenu "   /;           
LOOP(h,
    PUT @8  h.TE(h)                             @55 "TDH(" h.TL:0 ")"       @90 valTDH(h,'base'):>10:3          @105 valTDH(h,'sim'):>10:3          @120 valTDH(h,'var'):>10:3 /;
);
PUT @8 "Societes"                               @55 "TDF"                   @90 valTDF('base'):>10:3            @105 valTDF('sim'):>10:3            @120 valTDF('var'):>10:3 /;
PUT /;

PUT @6 "Revenu des transferts"                  @55 "YGTRA"                 @90 valYGTRA('base'):>10:3                  @105 valYGTRA('sim'):>10:3                  @120 valYGTRA('var'):>10:3 /;
PUT @8 "Reste du monde"                         @55 "TRA(gvt,row)"          @90 valTRA('gvt','row','base'):>10:3        @105 valTRA('gvt','row','sim'):>10:3        @120 valTRA('gvt','row','var'):>10:3 /;
PUT /;

PUT @6 "Revenu des recettes non fiscales"       @55 "YGNTX"                 @90 valYGNTX('base'):>10:3                  @105 valYGNTX('sim'):>10:3                  @120 valYGNTX('var'):>10:3 /;
PUT @8 "Societes"                               @55 "NTXF"                  @90 valNTXF('base'):>10:3           @105 valNTXF('sim'):>10:3       @120 valNTXF('var'):>10:3 /;
LOOP(h,
   PUT @8 h.te(h)                               @55 "NTXH(" h.TL:0 ")"      @90 valNTXH(h,'base'):>10:3         @105 valNTXH(h,'sim'):>10:3         @120 valNTXH(h,'var'):>10:3 /;
);
PUT /;

PUT @4 "Emplois"     /;                 
LOOP(h, 
    PUT @6 "Transf. aux "  h.TE(h):<15          @55 "TRA(" h.TL:0 ",gvt)"   @90 valTRA(h,'gvt','base'):>10:3        @105 valTRA(h,'gvt','sim'):>10:3        @120 valTRA(h,'gvt','var'):>10:3 /;
);
PUT @6 "Transf. aux Autres APU et aux ISBLSM"   @55 "TRA(ngo,gvt)"          @90 valTRA('ngo','gvt','base'):>10:3    @105 valTRA('ngo','gvt','sim'):>10:3    @120 valTRA('ngo','gvt','var'):>10:3 /;
PUT @6 "Transf. aux Entreprises"                @55 "TRA(firm,gvt)"         @90 valTRA('firm','gvt','base'):>10:3   @105 valTRA('firm','gvt','sim'):>10:3   @120 valTRA('firm','gvt','var'):>10:3 /;
PUT @6 "Transf. au RDM"                         @55 "TRA(row,gvt)"          @90 valTRA('row','gvt','base'):>10:3    @105 valTRA('row','gvt','sim'):>10:3    @120 valTRA('row','gvt','var'):>10:3 /;
PUT @6 "Budget de consommation publique"        @55 "G(pub)"                @90 valG('pub', 'base'):>10:3           @105 valG('pub','sim'):>10:3            @120 valG('pub','var'):>10:3 /;
PUT @6 "Epargne publique"                       @55 "SG"                    @90 valSG('base'):>10:3                 @105 valSG('sim'):>10:3                 @120valSG('var'):>10:3 /;
PUT /;

PUT "=================================================================================================================================" //;

PUT "COMPTE DES AUTRES APU ET DES ISBLSM" /;
PUT @4 "Ressources/Emplois total"               @55 "YNGO"                  @90 valYNGO('base'):>10:3               @105 valYNGO('sim'):>10:3               @120 valYNGO('var'):>10:3 /;
PUT /;
PUT @4 "Ressources"     /;                 
PUT @6 "Transf. recus du gouv."                 @55 "TRA(ngo,gvt)"          @90 valTRA('ngo','gvt','base'):>10:3    @105 valTRA('ngo','gvt','sim'):>10:3    @120 valTRA('ngo','gvt','var'):>10:3 /;
PUT @6 "Transf. recus du RDM"                   @55 "TRA(row,gvt)"          @90 valTRA('ngo','row','base'):>10:3    @105 valTRA('ngo','row','sim'):>10:3    @120 valTRA('ngo','row','var'):>10:3 /;
PUT @6 "Transf. recus des Soc."                 @55 "TRA(ngo,firm)"         @90 valTRA('ngo','firm','base'):>10:3   @105 valTRA('ngo','firm','sim'):>10:3   @120 valTRA('ngo','firm','var'):>10:3 /;
PUT @6 "Revenus non fiscaux venant des menages" @55 "NTXHH(ngo)"            @90 valNTXHH('ngo','base'):>10:3        @105 valNTXHH('ngo','sim'):>10:3        @120 valNTXHH('ngo','var'):>10:3 /;
PUT /;
PUT @4 "Emplois"     /;                 
LOOP(h,
    PUT @6 "Transf. aux " h.TE(h):<30           @55 "TRA(" h.TL:0 ",ngo)"   @90 valTRA(h,'ngo','base'):>10:3        @105 valTRA(h,'ngo','sim'):>10:3        @120 valTRA(h,'ngo','var'):>10:3 /;
);
PUT @6 "Budget de consommation"                 @55 "G(ontr)"               @90 valG('ontr','base'):>10:3           @105 valG('ontr','sim'):>10:3           @120 valG('ontr','var'):>10:3 /;
PUT @6 "Epargne"                                @55 "SNGO"                  @90 valSNGO('base'):>10:3               @105 valSNGO('sim'):>10:3               @120 valSNGO('var'):>10:3 /;
PUT /;

PUT "=================================================================================================================================" //;

PUT "COMPTE DU RESTE DU MONDE" /;
PUT @4 "Ressources/Emplois totals"              @55 "YROW"                  @90 valYROW('base'):>10:3               @105 valYROW('sim'):>10:3                @120 valYROW('var'):>10:3 /;
PUT /;
PUT @4 "Ressources"     /;
PUT @6 "Remuner. des employes non-residents"    @55 "YROWL"                 @90 valYROWL('base'):>10:3              @105 valYROWL('sim'):>10:3              @120 valYROWL('var'):>10:3 /;
PUT @6 "Remuner. du capital des non-residents"  @55 "YROWK"                 @90 valYROWK('base'):>10:3              @105 valYROWK('sim'):>10:3              @120 valYROWK('var'):>10:3 /;
PUT @6 "Transf. recus de l'Adm. cent."          @55 "TRA(row,gvt)"          @90 valTRA('row','gvt','base'):>10:3    @105 valTRA('row','gvt','sim'):>10:3    @120 valTRA('row','gvt','var'):>10:3 /;
PUT @6 "Importations de biens et services"      @55 "e*SUM[tr, PWM(tr)*IM(tr)]"
                                                                            @90 valIMTOT('base'):>10:3              @105 valIMTOT('sim'):>10:3              @120 valIMTOT('var'):>10:3 /;
PUT /;

PUT @4 "Emplois"     /;
PUT @6 "Remuner. des employes residents"        @55 "e*W_R*LD_R"            @90 valFROWL('base'):>10:3              @105 valFROWL('sim'):>10:3              @120 valFROWL('var'):>10:3 /;
PUT @6 "Remuner. du capital des residents"      @55 "e*R_R*KD_R"            @90 valFROWK('base'):>10:3              @105 valFROWK('sim'):>10:3              @120 valFROWK('var'):>10:3 /;
LOOP(h,
    PUT @6 "Transf. aux "  h.TE(h):<15          @55 "TRA(" h.TL:0 ",row)"   @90 valTRA(h,'row','base'):>10:3        @105 valTRA(h,'row','sim'):>10:3        @120 valTRA(h,'row','var'):>10:3 /;
)
PUT @6 "Transf. aux Gouvernement"               @55 "TRA(gvt,row)"          @90 valTRA('gvt','row','base'):>10:3    @105 valTRA('gvt','row','sim'):>10:3    @120 valTRA('gvt','row','var'):>10:3 /;
PUT @6 "Transf. aux autres APU et aux ISBLSM"   @55 "TRA(ngo,row)"          @90 valTRA('ngo','row','base'):>10:3    @105 valTRA('ngo','row','sim'):>10:3    @120 valTRA('ngo','row','var'):>10:3 /;
PUT @6 "Transf. aux Entreprises"                @55 "TRA(firm,row)"         @90 valTRA('firm','row','base'):>10:3   @105 valTRA('firm','row','sim'):>10:3   @120 valTRA('firm','row','var'):>10:3 /;
PUT @6 "Exportations de biens et services"      @55 "e*SUM[tr, PWE(tr)*EX(tr)]"
                                                                            @90 valEXTOT('base'):>10:3              @105 valEXTOT('sim'):>10:3              @120 valEXTOT('var'):>10:3 /;
PUT @6 "Epargne"                                @55 "SROW"                  @90 valSROW('base'):>10:3               @105 valSROW('sim'):>10:3               @120 valSROW('var'):>10:3 /;
PUT /;

PUT "=================================================================================================================================" //;

PUT "COMPTE NATIONAUX" /;

PUT @2 "Valeurs reelles" /;
PUT @4 "PIB reel aux prix de base"                  @55 "PIB_BP_reel"                         @90 valPIB_BP_reel('base'):>10:3    @105 valPIB_BP_reel('sim'):>10:3  @120 valPIB_BP_reel('var'):>10:3 /;
PUT @4 "PIB reel aux prix du marche"                @55 "PIB_MP_reel"                         @90 valPIB_MP_reel('base'):>10:3    @105 valPIB_MP_reel('sim'):>10:3  @120 valPIB_MP_reel('var'):>10:3 /;
PUT /;

LOOP(h, PUT @4 "Cons. tot. finale des " h.TE(h):<15 @55 "CTH_reel(" h.TL:0 ")"                @90 valCTH_reel(h,'base'):>10:3     @105 valCTH_reel(h,'sim'):>10:3   @120 valCTH_reel(h,'var'):>10:3 /;
    );
PUT /;


LOOP(trj,
    PUT @4 trj.TE(trj):<15                          @55 "XS(" trj.TL:0 ")"                     @90 valXS(trj,'base'):>10:3          @105 valXS(trj,'sim'):>10:3        @120 valXS(trj,'var'):>10:3 /;
    PUT @6 "Valeur ajoutee"                         @55 "VA(" trj.TL:0 ")"                     @90 valVA(trj,'base'):>10:3          @105 valVA(trj,'sim'):>10:3        @120 valVA(trj,'var'):>10:3 /;
    PUT @8 "Travail"                                @55 "LD(" trj.TL:0 ")"                     @90 valLD(trj,'base'):>10:3          @105 valLD(trj,'sim'):>10:3        @120 valLD(trj,'var'):>10:3 /;
    PUT @8 "Capital"                                @55 "KD(" trj.TL:0 ")"                     @90 valKD(trj,'base'):>10:3          @105 valKD(trj,'sim'):>10:3        @120 valKD(trj,'var'):>10:3 /;
    PUt /;
    
    PUT @6 "Consommation intermediaire "            @55 "CI(" trj.TL:0 ")"                     @90 valCI(trj,'base'):>10:3          @105 valCI(trj,'sim'):>10:3        @120 valCI(trj,'var'):>10:3 /;
    LOOP(tr,
        PUT @8 "Demande intermediare en : " tr.TE(tr)                        
                                                    @55 "DI(" tr.TL:0 "," trj.TL:0 ")"         @90 valDI(tr,trj,'base'):>10:3       @105 valDI(tr,trj,'sim'):>10:3     @120 valDI(tr,trj,'var'):>10:3 /;
    );
    PUt /;
    
    LOOP(h, PUT @6 "Cons. finale des " h.TE(h):<15  @55 "CH(" trj.TL:0 "," h.TL:0 ")"          @90 valCH(trj,h,'base'):>10:3        @105 valCH(trj,h,'sim'):>10:3      @120 valCH(trj,h,'var'):>10:3 /;
    );
    PUT @6 "Investissement "                        @55 "INV(" trj.TL:0 ")"                    @90 valINV(trj,'base'):>10:3         @105 valINV(trj,'sim'):>10:3       @120 valINV(trj,'var'):>10:3 /;
    LOOP(bns$(sameas(bns, trj)),
        PUT @6 "Variation de stocks "               @55 "VSTK(" trj.TL:0 ")"                   @90 valVSTK(bns,'base'):>10:3        @105 valVSTK(bns,'sim'):>10:3      @120 valVSTK(bns,'var'):>10:3 /;
    );
    PUT @6 "Exportations "                          @55 "EX(" trj.TL:0 ")"                     @90 valEX(trj,'base'):>10:3          @105 valEX(trj,'sim'):>10:3        @120 valEX(trj,'var'):>10:3 /;
    PUT @6 "Importations "                          @55 "IM(" trj.TL:0 ")"                     @90 valIM(trj,'base'):>10:3          @105 valIM(trj,'sim'):>10:3        @120 valIM(trj,'var'):>10:3 /;
    PUt /;
);


LOOP(ntr,
    PUT @4 ntr.TE(ntr)                              @55 "XS(" ntr.TL:0 ")"                    @90 valXS(ntr,'base'):>10:3         @105 valXS(ntr,'sim'):>10:3       @120 valXS(ntr,'var'):>10:3 /;
    PUT @6 "Valeur ajoutee"                         @55 "VA(" ntr.TL:0 ")"                    @90 valVA(ntr,'base'):>10:3         @105 valVA(ntr,'sim'):>10:3       @120 valVA(ntr,'var'):>10:3 /;
    PUT @8 "Travail"                                @55 "LD(" ntr.TL:0 ")"                    @90 valLD(ntr,'base'):>10:3         @105 valLD(ntr,'sim'):>10:3       @120 valLD(ntr,'var'):>10:3 /;
    PUt /;
    
    PUT @6 "Consommation intermediaire "            @55 "CI(" ntr.TL:0 ")"                    @90 valCI(ntr,'base'):>10:3         @105 valCI(ntr,'sim'):>10:3       @120 valCI(ntr,'var'):>10:3 /;
    LOOP(trj,
        PUT @8 "Demande intermediare en : " trj.TE(trj)                        
                                                    @55 "DI(" trj.TL:0 "," ntr.TL:0 ")"       @90 valDI(trj,ntr,'base'):>10:3     @105 valDI(trj,ntr,'sim'):>10:3   @120 valDI(trj,ntr,'var'):>10:3 /;
    );
    PUt /;
    
    PUT @6 "Cons. finale des " ntr.TE(ntr):<15      @55 "G_reel(" ntr.TL:0 ")"                @90 valG_reel(ntr,'base'):>10:3     @105 valG_reel(ntr,'sim'):>10:3   @120 valG_reel(ntr,'var'):>10:3 /;
        PUT /;
);
PUT "---------------------------------------------------------------------------------------------------------------------------------" //;
PUT @2 "Valeurs nominales" /;
PUT @4 "PIB aux prix de base"                       @55 "PIB_BP"                              @90 valPIB_BP('base'):>10:3         @105 valPIB_BP('sim'):>10:3       @120 valPIB_BP('var'):>10:3 /;
PUT @4 "PIB aux prix du marche"                     @55 "PIB_MP"                              @90 valPIB_MP('base'):>10:3         @105 valPIB_MP('sim'):>10:3       @120 valPIB_MP('var'):>10:3 /;
PUT @4 "PIB aux prix du marche (approche revenue)"  @55 "PIB_IB"                              @90 valPIB_IB('base'):>10:3         @105 valPIB_IB('sim'):>10:3       @120 valPIB_IB('var'):>10:3 /;
PUT @4 "PIB aux prix du marche (approche demande)"  @55 "PIB_FD"                              @90 valPIB_FD('base'):>10:3         @105 valPIB_FD('sim'):>10:3       @120 valPIB_FD('var'):>10:3 /;
PUT /;

LOOP(h, PUT @4 "Cons. tot. finale des " h.TE(h):<15 @55 "CTH(" h.TL:0 ")"                     @90 valCTH(h,'base'):>10:3          @105 valCTH(h,'sim'):>10:3        @120 valCTH(h,'var'):>10:3 /;
    );
PUT /;
PUT @4 "Investissement total"                       @55 "IT"                                  @90 valIT('base'):>10:3             @105 valIT('sim'):>10:3           @120 valIT('var'):>10:3 /;
PUT @4 "Formation Brute de Capital Fixe"            @55 "FBCF"                                @90 valFBCF('base'):>10:3           @105 valFBCF('sim'):>10:3         @120 valFBCF('var'):>10:3 /;
PUT /;

LOOP(trj,
    PUT @4 trj.TE(trj):<15                            @55 "P(" trj.TL:0 ")*XS(" trj.TL:0 ")"      @90 valXS_nom(trj,'base'):>10:3      @105 valXS_nom(trj,'sim'):>10:3    @120 valXS_nom(trj,'var'):>10:3 /;
    PUT @6 "Valeur ajoutee"                         @55 "PVA(" trj.TL:0 ")*VA(" trj.TL:0 ")"    @90 valVA_nom(trj,'base'):>10:3      @105 valVA_nom(trj,'sim'):>10:3    @120 valVA_nom(trj,'var'):>10:3 /;
    PUT @8 "trjavail"                                @55 "W*LD(" trj.TL:0 ")"                   @90 valLD_nom(trj,'base'):>10:3      @105 valLD_nom(trj,'sim'):>10:3    @120 valLD_nom(trj,'var'):>10:3 /;
    PUT @8 "Capital"                                @55 "R(" trj.TL:0 ")*KD(" trj.TL:0 ")"      @90 valKD_nom(trj,'base'):>10:3      @105 valKD_nom(trj,'sim'):>10:3    @120 valKD_nom(trj,'var'):>10:3 /;
    PUt /;
    
    PUT @6 "Consommation intermediaire "            @55 "PCI(" trj.TL:0 ")*CI(" trj.TL:0 ")"    @90 valCI_nom(trj,'base'):>10:3      @105 valCI_nom(trj,'sim'):>10:3    @120 valCI_nom(trj,'var'):>10:3 /;
    LOOP(tr,
        PUT @8 "Demande intermediare en : " tr.TE(tr)                        
                                                    @55 "PC(" trj.TL:0 ")*DI(" tr.TL:0 "," trj.TL:0 ")"       
                                                                                              @90 valDI_nom(tr,trj,'base'):>10:3   @105 valDI_nom(tr,trj,'sim'):>10:3 @120 valDI_nom(tr,trj,'var'):>10:3 /;
    );
    PUT /;
    
    LOOP(h, PUT @6 "Cons. finale des " h.TE(h):<15  @55 "PC(" trj.TL:0 ")*CH(" trj.TL:0 "," h.TL:0 ")"   
                                                                                              @90 valCH_nom(trj,h,'base'):>10:3    @105 valCH_nom(trj,h,'sim'):>10:3  @120 valCH_nom(trj,h,'var'):>10:3 /;
    );
    PUT @6 "Investissement "                        @55 "PC(" trj.TL:0 ")*INV(" trj.TL:0 ")"    @90 valINV_nom(trj,'base'):>10:3     @105 valINV_nom(trj,'sim'):>10:3   @120 valINV_nom(trj,'var'):>10:3 /;
    LOOP(bns$(sameas(bns, trj)),
        PUT @6 "Variation de stocks "               @55 "PC(" trj.TL:0 ")*VSTK(" trj.TL:0 ")"   @90 valVSTK_nom(bns,'base'):>10:3   @105 valVSTK_nom(bns,'sim'):>10:3 @120 valVSTK_nom(bns,'var'):>10:3 /;
    );
    PUT @6 "Exportations "                          @55 "PE(" trj.TL:0 ")*EX(" trj.TL:0 ")"     @90 valEX_nom(trj,'base'):>10:3      @105 valEX_nom(trj,'sim'):>10:3    @120 valEX_nom(trj,'var'):>10:3 /;
    PUT @6 "Importations "                          @55 "PM(" trj.TL:0 ")*IM(" trj.TL:0 ")"     @90 valIM_nom(trj,'base'):>10:3      @105 valIM_nom(trj,'sim'):>10:3    @120 valIM_nom(trj,'var'):>10:3 /;
    PUt /;
);

LOOP(ntr,
    PUT @4 ntr.TE(ntr)                              @55 "P(" ntr.TL:0 ")*XS(" ntr.TL:0 ")"    @90 valXS_nom(ntr,'base'):>10:3     @105 valXS_nom(ntr,'sim'):>10:3   @120 valXS_nom(ntr,'var'):>10:3 /;
    PUT @6 "Valeur ajoutee"                         @55 "PVA(" ntr.TL:0 ")*VA(" ntr.TL:0 ")"  @90 valVA_nom(ntr,'base'):>10:3     @105 valVA_nom(ntr,'sim'):>10:3   @120 valVA_nom(ntr,'var'):>10:3 /;
    PUT @8 "Travail"                                @55 "W*LD(" ntr.TL:0 ")"                  @90 valLD_nom(ntr,'base'):>10:3     @105 valLD_nom(ntr,'sim'):>10:3   @120 valLD_nom(ntr,'var'):>10:3 /;
    PUt /;
    
    PUT @6 "Consommation intermediaire "            @55 "PCI(" ntr.TL:0 ")*CI(" ntr.TL:0 ")"  @90 valCI_nom(ntr,'base'):>10:3     @105 valCI_nom(ntr,'sim'):>10:3   @120 valCI_nom(ntr,'var'):>10:3 /;
    LOOP(trj,
        PUT @8 "Demande intermediare en : " trj.TE(trj)                       
                                                    @55 "PC(" ntr.TL:0 ")*DI(" trj.TL:0 "," ntr.TL:0 ")"        
                                                                                              @90 valDI_nom(trj,ntr,'base'):>10:3  @105 valDI_nom(trj,ntr,'sim'):>10:3 @120 valDI_nom(trj,ntr,'var'):>10:3 /;
    );
    PUt /;
    
    PUT @6 "Cons. finale des " ntr.TE(ntr):<15      @55 "G(" ntr.TL:0 ")"                     @90 valG(ntr,'base'):>10:3          @105 valG(ntr,'sim'):>10:3         @120 valG(ntr,'var'):>10:3 /;
        PUT /;
);

PUT "=================================================================================================================================" //;

PUT "SYSTEME DES PRIX" /;
* Prix des Produits (Marché)
PUT @4 "Prix du producteur"                         @55 "P"                         @90 ""                          @105 ""                          @120 "" /;
LOOP(j,
    PUT @6 j.TE(j)                                  @55 "P(" j.TL:0 ")"             @90 valP(j,'base'):>10:3        @105 valP(j,'sim'):>10:3         @120 valP(j,'var'):>10:3 /;
);
PUT /

PUT @4 "Prix sur le marche local (hors taxes et marges)"
                                                    @55 "PL"                        @90 ""                          @105 ""                          @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PL(" tr.TL:0 ")"           @90 valPL(tr,'base'):>10:3      @105 valPL(tr,'sim'):>10:3      @120 valPL(tr,'var'):>10:3 /;
);
PUT /

PUT @4 "Prix du bien domestic (hors marges)"        @55 "PPD"                       @90 ""                          @105 ""                          @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PPD(" tr.TL:0 ")"          @90 valPPD(tr,'base'):>10:3     @105 valPPD(tr,'sim'):>10:3      @120 valPPD(tr,'var'):>10:3 /;
);
PUT /

PUT @4 "Prix du bien domestic (y.c. marges)"        @55 "PD"                        @90 ""                          @105 ""                         @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PD(" tr.TL:0 ")"           @90 valPD(tr,'base'):>10:3      @105 valPD(tr,'sim'):>10:3      @120 valPD(tr,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix du bien importe (hors marges)"         @55 "PPM"                       @90 ""                          @105 ""                         @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PPM(" tr.TL:0 ")"          @90 valPPM(tr,'base'):>10:3     @105 valPPM(tr,'sim'):>10:3     @120 valPPM(tr,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix du bien importe (y.c. marges)"         @55 "PM"                        @90 ""                          @105 ""                         @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PM(" tr.TL:0 ")"           @90 valPM(tr,'base'):>10:3      @105 valPM(tr,'sim'):>10:3      @120 valPM(tr,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix du bien composite"                     @55 "PC"                        @90 ""                          @105 ""                         @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PC(" tr.TL:0 ")"           @90 valPC(tr,'base'):>10:3      @105 valPC(tr,'sim'):>10:3      @120 valPC(tr,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix a l'exportation"                       @55 "PE"                        @90 ""                          @105 ""                         @120 "" /;
LOOP(tr,
    PUT @6 tr.TE(tr)                                @55 "PE(" tr.TL:0 ")"           @90 valPE(tr,'base'):>10:3      @105 valPE(tr,'sim'):>10:3      @120 valPE(tr,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix de la Valeur Ajoutee"                  @55 "PVA"                       @90 ""                          @105 ""                         @120 "" /;
LOOP(j,
    PUT @6 j.TE(j)                                  @55 "PVA(" j.TL:0 ")"           @90 valPVA(j,'base'):>10:3      @105 valPVA(j,'sim'):>10:3      @120 valPVA(j,'var'):>10:3 /;
);
PUT /;

PUT @4 "Prix de la cons. intermediaire"             @55 "PCI"                       @90 ""                          @105 ""                         @120 "" /;
LOOP(j,
    PUT @6 "Branche " j.TE(j)                       @55 "PCI(" j.TL:0 ")"           @90 valPCI(j,'base'):>10:3      @105 valPCI(j,'sim'):>10:3      @120 valPCI(j,'var'):>10:3 /;
);
PUT /;

* Prix des Facteurs
PUT @4 "Prix des Facteurs de production"            @55 ""                          @90 ""                          @105 ""                         @120 "" /;
PUT @6 "Remuneration des salaries"                  @55 "W"                         @90 valW('base'):>10:3          @105 valW('sim'):>10:3          @120 valW('var'):>10:3 /;
PUT @6 "Remuneration du capital"                    @55 "R"          /;
LOOP(trj,
    PUT @8 trj.TE(trj)                              @55 "R(" trj.TL:0 ")"            @90 valR(trj,'base'):>10:3       @105 valR(trj,'sim'):>10:3       @120 valR(trj,'var'):>10:3 /;
);
PUT /;

* Indicateurs Macro
PUT @4 "Indicateurs de prix agreges"     /; 
PUT @6 "Deflateur du PIB"                           @55 "PIXGDP"                    @90 valPIXGDP('base'):>10:3     @105 valPIXGDP('sim'):>10:3     @120 valPIXGDP('var'):>10:3 /;
PUT @6 "Indice des prix a la cons."                 @55 "PIXCON"                    @90 valPIXCON('base'):>10:3     @105 valPIXCON('sim'):>10:3     @120 valPIXCON('var'):>10:3 /;
PUT @6 "Deflateur investissement"                   @55 "PIXINV"                    @90 valPIXINV('base'):>10:3     @105 valPIXINV('sim'):>10:3     @120 valPIXINV('var'):>10:3 /;
PUT /;

* --- Prix mondiaux et indicateurs de change ---
PUT @4 "Prix mondiaux et indicateurs de change" /;
PUT @6 "Taux de change nominal"                     @55 "e"                         @90 vale('base'):>10:3          @105 vale('sim'):>10:3          @120 vale('var'):>10:3 /;
PUT @6 "Remun. capital RDM (devise)"                @55 "R_R"                       @90 valR_R('base'):>10:3        @105 valR_R('sim'):>10:3        @120 valR_R('var'):>10:3 /;
PUT @6 "Salaire RDM (devise)"                       @55 "W_R"                       @90 valW_R('base'):>10:3        @105 valW_R('sim'):>10:3        @120 valW_R('var'):>10:3 /;
PUT /;
PUT @6 "Prix mondial importations"                  @55 "PWM" /;
LOOP(tr,
    PUT @8 tr.TE(tr)                                @55 "PWM(" tr.TL:0 ")"          @90 valPWM(tr,'base'):>10:3      @105 valPWM(tr,'sim'):>10:3      @120 valPWM(tr,'var'):>10:3 /;
);
PUT /;
PUT @6 "Prix mondial exportations"                  @55 "PWE"    /;
LOOP(tr,
    PUT @8 tr.TE(tr)                                @55 "PWE(" tr.TL:0 ")"          @90 valPWE(tr,'base'):>10:3      @105 valPWE(tr,'sim'):>10:3      @120 valPWE(tr,'var'):>10:3 /;
);
PUT /;

PUT "================================================================================================================================================" //;

SCALAR pos;
pos = 75;

PUT  "VALEURS DES PARAMETRES DU MODELE"
PUT //;

PUT "1. PARAMETRES DE PRODUCTION" /;
PUT                                 @55             @75 LOOP(j,  PUT @pos j.TL:>10;     pos = pos + 15; );          pos = 75;        PUT /;
PUT "Parametre d'echelle"           @55 "A"         @75 LOOP(trj, PUT @pos A(trj):>10:3;  pos = pos + 15; );          pos = 75;        PUT /;
PUT "Elasticite VA"                 @55 "alpha"     @75 LOOP(trj, PUT @pos alpha(trj):>10:3;     pos = pos + 15; );   pos = 75;        PUT /;
PUT "Coeff. valeur ajoutee"         @55 "v"         @75 LOOP(j,  PUT @pos v(j):>10:3;   pos = pos + 15; );          pos = 75;        PUT /;
PUT "Coeff. cons. intermed."        @55 "io"        @75 LOOP(j,  PUT @pos io(j):>10:3;  pos = pos + 15; );          pos = 75;        PUT /;
PUT "Coeff. technique"              @55 "aij";                                                                                       PUT /;
LOOP(tr,
    PUT @4 tr.TL                    @55             @75 LOOP(j,  PUT @pos aij(tr,j):>10:3;  pos = pos + 15;  );     pos = 75;        PUT /;
);
PUT "Coeff. technique du make matrix"   @55 "theta"                                                                                  PUT /;
LOOP(trj,
    PUT @4 trj.TL                   @55             @75 LOOP(tri, PUT @pos theta(tri,trj):>10:3;  pos = pos + 15;  ); pos = 75;        PUT /;
);
PUT //;


PUT "2. PARAMETRES DU COMMERCE EXTERIEUR" /;
PUT                                 @55             @75 LOOP(trj, PUT @pos trj.TL:>10;         pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Echelle Armington"             @55 "A_M"       @75 LOOP(trj, PUT @pos A_M(trj):>10:3;     pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Echelle transformation"        @55 "A_E"       @75 LOOP(trj, PUT @pos A_E(trj):>10:3;     pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Elasticite de subst."          @55 "sigma_M"   @75 LOOP(trj, PUT @pos sigma_M(trj):>10:3; pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Elasticite de transf."         @55 "sigma_E"   @75 LOOP(trj, PUT @pos sigma_E(trj):>10:3; pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Part de repart. Imp."          @55 "beta_M"    @75 LOOP(trj, PUT @pos beta_M(trj):>10:3;  pos = pos + 15;  );    pos = 75;        PUT /;
PUT "Part de repart. Exp."          @55 "beta_E"    @75 LOOP(trj, PUT @pos beta_E(trj):>10:3;  pos = pos + 15;  );    pos = 75;        PUT /;
PUT //;

PUT "5. FISCALITE ET MARGES" /;
PUT                                 @55             @75 LOOP(tr,  PUT @pos tr.TL:>10;       pos = pos + 15;  );     pos = 75;        PUT /;
PUT "Taux droits de douane"         @55 "tm"        @75 LOOP(tr,  PUT @pos tm(tr):>10:3;    pos = pos + 15;  );     pos = 75;        PUT /;
PUT "Taux taxes indirectes"         @55 "tx"        @75 LOOP(tr,  PUT @pos tx(tr):>10:3;    pos = pos + 15;  );     pos = 75;        PUT /;
PUT "Taux marge commerciale"        @55 "tmgc"      @75 LOOP(bns, PUT @pos tmgc(bns):>10:3; pos = pos + 15;  );     pos = 75;        PUT /;
PUT "Taux marge transport"          @55 "tmgt"      @75 LOOP(bns, PUT @pos tmgt(bns):>10:3; pos = pos + 15;  );     pos = 75;        PUT /;
PUT /;


PUT "3. MÉNAGES ET DEMANDE FINALE" /;
PUT                                             @55                             @75 LOOP(tr, PUT @pos tr.TL:>10;            pos = pos + 15;  );     pos = 75;       PUT /;
LOOP (h,
    PUT "Part budget cons. des " h.TE(h)        @55 "gamma_CH("  h.Tl:0 ")"     @75 LOOP(tr, PUT @pos gamma_CH(tr,h):>10:3; pos = pos + 15; );      pos = 75;       PUT /;
    );
PUT "Part investissement"                       @55 "gamma_INV"                 @75 LOOP(tr, PUT @pos gamma_INV(tr):>10:3;  pos = pos + 15; );      pos = 75;       PUT /;
PUT //;

PUT "4. PARAMETRES SOCIO-ECONOMIQUES" /;
PUT                                            @55                     @75 LOOP(h, PUT @pos h.TL:>10;          pos = pos + 15;  );     pos = 75;   PUT @105 "FIRM":>10;    PUT @120"RDM":>10 /;
PUT "Propension a epargner"                    @55 "psi"               @75 LOOP(h, PUT @pos psi(h):>10:3;      pos = pos + 15;  );     pos = 75;   PUT /;
PUT "Propension a verser des rec. non fisc."   @55 "ntyh/ntyf"              @75 LOOP(h, PUT @pos ntyh(h):>10:3;      pos = pos + 15;  );     pos = 75;   PUT @105ntyf:>10:3       PUT /;

PUT "Part revenu du travail"            @55 "phi"               @75 LOOP(h, PUT @pos phi(h):>10:3;      pos = pos + 15;  );     pos = 75;   PUT /;
PUT "Part revenu du capital"            @55 "lambda/lambda_R"   @75 LOOP(h, PUT @pos lambda(h):>10:3;   pos = pos + 15;  );     pos = 75;   PUT @105 "":>10;        PUT @120 lambda_R:>10:3 /;
PUT "Taux de taxe directe"              @55 "tyh/tyf"           @75 LOOP(h, PUT @pos tyh(h):>10:3;      pos = pos + 15;  );     pos = 75;   PUT @105tyf:>10:3       PUT /;
PUT "Taux autres taxes BS"              @55 "sifi"              @75 LOOP(h, PUT @pos "";                pos = pos + 15;  );     pos = 75;   PUT @105syfi:>10:3       PUT /;
PUT "Taux autres droits de douanes"     @55 "sifm"              @75 LOOP(h, PUT @pos "";                pos = pos + 15;  );     pos = 75;   PUT @105syfm:>10:3       PUT /;

PUT //;

PUT "5. FONCTIONS DE TRANSFERTS" /;
PUT                                     @55 "lambda_TRA"        @75 LOOP(agd, PUT @pos agd.TL:>10;          pos = pos + 15;  );     pos = 75;  PUT /;
LOOP(ag,
    PUT  ag.TE(ag) @55 ag.TL:0 ;
    
    pos = 75;
    LOOP(agd,
* Test si la valeur est differente de 0
        IF(lambda_TRA(ag,agd) <> 0,
            PUT @pos lambda_TRA(ag,agd):>10:3;
        ELSE
* Si c'est zero, on met du vide (ou des espaces)
            PUT @pos "";
        );
        pos = pos + 15;
    );
    PUT /;
)
PUT "================================================================================================================================================" //;

PUTCLOSE REPCMP;