// **************************************
//					EXIT 
// **************************************

instance DIA_845_Exit (C_INFO)
{
	npc			= Org_845_Schlaeger;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_845_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_845_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Hallo
// **************************************

instance DIA_845_Hello (C_INFO)
{
	npc			= Org_845_Schlaeger;
	nr			= 1;
	condition	= DIA_845_Hello_Condition;
	information	= DIA_845_Hello_Info;
	permanent	= 0;
	description	= "Чем ты занимаешься?";
};                       

FUNC int DIA_845_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_845_Hello_Info()
{
	AI_Output (other, self,"DIA_845_Hello_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_845_Hello_13_01"); //Я работаю на Лорда.
	
	var C_NPC Lefty; Lefty = Hlp_GetNpc (Org_844_Lefty);
	if (!Npc_IsDead(Lefty))
	{
		AI_Output (self, other,"DIA_845_Hello_13_02"); //Если тебе что-нибудь нужно, спроси Лефти.
	};
};


