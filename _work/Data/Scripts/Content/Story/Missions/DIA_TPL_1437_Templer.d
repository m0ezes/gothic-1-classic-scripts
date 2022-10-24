
// ************************ EXIT **************************

instance  Tpl_1437_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1437_Templer;
	nr			=  999;
	condition	=  Tpl_1437_Templer_Exit_Condition;
	information	=  Tpl_1437_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** BESSER NICHT ANSPRECHEN ****************************************//

instance  Tpl_1437_Templer_NERV (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_NERV_Condition;
	information		= Tpl_1437_Templer_NERV_Info;
	important		= 0;
	permanent		= 1;
	description		= "��� ����?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //��� ����?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //������, �� ���, ������� ���� ����� �������?
	AI_StopProcessInfos	( self );
};  
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVE (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVE_Condition;
	information		= Tpl_1437_Templer_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ���� ��� � �������?"; 
};

FUNC int  Tpl_1437_Templer_LEAVE_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_NERV)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //� ���� ��� � �������?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //� ���� �������� ����, ����? ���, ������� ���-������!
	AI_StopProcessInfos	( self );
};
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVENOW (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVENOW_Condition;
	information		= Tpl_1437_Templer_LEAVENOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� � �� ������� ����!"; 
};

FUNC int  Tpl_1437_Templer_LEAVENOW_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_LEAVE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //�� � �� ������� ����!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //��, ������. � ���� �������!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //���� ������!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //�������� �� ���� �����!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //������� ������ �� ��� �� �������!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //������ ���, ����� � ���� ������ �� �����!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //����� ���!
	AI_StopProcessInfos	( self );
};

