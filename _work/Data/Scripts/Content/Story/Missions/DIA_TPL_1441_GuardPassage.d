//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		TPL_1441_Templer
//	Lager:				
//	Durchgang:
//	Uhrzeit:
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	TPL_1441_CHECKPOINT		= "PSI_TEMPLE_IN";

instance Info_TPL_1441_FirstWarn (C_INFO)
{
	npc			= TPL_1441_Templer;
	nr			= 1;
	condition	= Info_TPL_1441_FirstWarn_Condition;
	information	= Info_TPL_1441_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_TPL_1441_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_TPL_1441_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output 		(self, hero,"Info_TPL_1441_FirstWarn_13_01"); //STÓJ! Na świątynne wzgórze można wejść tylko za pozwoleniem któregoś z Guru!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	if (Npc_KnowsInfo(hero, PC_Psionic_SEND))
	{
		Info_Clearchoices 	(Info_TPL_1441_FirstWarn);
		Info_Addchoice 		(Info_TPL_1441_FirstWarn,"Sam Y'Berion udzielił mi pozwolenia.",	Info_TPL_1441_FirstWarn_Condition_YBERION);  
		Info_Addchoice 		(Info_TPL_1441_FirstWarn,"Przysyła mnie Nowicjusz Lester.",	Info_TPL_1441_FirstWarn_Condition_LESTER);  
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_TPL_1441_FirstWarn_Condition_YBERION ()
{
	AI_Output (hero, self,"Info_TPL_1441_FirstWarn_Condition_YBERION_15_01"); //Sam Y'Berion udzielił mi pozwolenia.
	AI_Output (self, hero,"Info_TPL_1441_FirstWarn_Condition_YBERION_13_02"); //Kłamcy łatwo mogą stracić język, więc uważaj co mówisz.
};

func void Info_TPL_1441_FirstWarn_Condition_LESTER ()
{
	AI_Output (hero, self,"Info_TPL_1441_FirstWarn_Condition_LESTER_15_01"); //Przysyła mnie Nowicjusz Lester. Chciałbym ofiarować moje usługi Y'Berionowi.
	AI_Output (self, hero,"Info_TPL_1441_FirstWarn_Condition_LESTER_13_02"); //Znam Lestera. Można mu zaufać. Możesz przejść.
	Info_Clearchoices 	(Info_TPL_1441_FirstWarn);

	//---- beide Wachen auf passieren schalten ----
	var C_NPC templer; templer = Hlp_GetNpc(TPL_1442_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] 			= TRUE;
	templer.aivar[AIV_PASSGATE] 		= TRUE;
};


//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_TPL_1441_LastWarn (C_INFO)
{
	npc			= TPL_1441_Templer;
	nr			= 1;
	condition	= Info_TPL_1441_LastWarn_Condition;
	information	= Info_TPL_1441_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_TPL_1441_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_TPL_1441_LastWarn_Info()
{
	AI_Output 		(self, hero,"Info_TPL_1441_LastWarn_13_01"); 		//Jeszcze jeden krok, a będzie po tobie.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_TPL_1441_Attack (C_INFO)
{
	npc			= TPL_1441_Templer;
	nr			= 1;
	condition	= Info_TPL_1441_Attack_Condition;
	information	= Info_TPL_1441_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_TPL_1441_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_TPL_1441_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
