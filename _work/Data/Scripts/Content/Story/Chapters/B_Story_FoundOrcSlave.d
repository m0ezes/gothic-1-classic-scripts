//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"� �������� ����� ��-���� � ����� �� ������ �������� ��������� �����. �� �������� ��������. ������ �������� � ���� �� ������ ���������, ������� ������� ��� ������, �� �����. �����, ���� ��� ������. ��������� ���-�� � ������ �������� �����.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
