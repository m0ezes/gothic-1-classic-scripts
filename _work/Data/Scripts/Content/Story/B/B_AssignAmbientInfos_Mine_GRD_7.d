// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_7_EXIT_Condition;
	information	= Info_Mine_Grd_7_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Mine_Condition;
	information	= Info_Mine_Grd_7_Mine_Info;
	permanent	= 1;
	description = "�ekni mi n�co o dole.";
};                       

FUNC INT Info_Mine_Grd_7_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00"); //Pov�dej mi o dole.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01"); //Kop��i rubou rudu a my je chr�n�me p�ed �ervy.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00"); //Kdo to tady vede?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ian a Asghan. Kdy� n�co chce�, m�l bys jim to ��ci.
	
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Minecrawler(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Minecrawler_Condition;
	information	= Info_Mine_Grd_7_Minecrawler_Info;
	permanent	= 1;
	description = "Co v� o �ervech.";
};                       

FUNC INT Info_Mine_Grd_7_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00"); //Co si mysl� o �ervech?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01"); //Spousta by jich m�la b�t vyhlazena, pokud se pt� m�!
	
	
};
// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_DieLage_Condition;
	information	= Info_Mine_Grd_7_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Mine_Grd_7_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00"); //Jak se m�?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01"); //Chlape, hraje� mi na nervy!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_7(var c_NPC slf)
{
	
	
	Info_Mine_Grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
