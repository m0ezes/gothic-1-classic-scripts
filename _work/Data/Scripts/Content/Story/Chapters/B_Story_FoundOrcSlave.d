//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_UluMulu,"Я встретил друга Ур-Шака в одном из нижних туннелей Свободной Шахты. Он назвался Тарроком. Таррок отравлен и если не найдет лекарство, которое потерял при побеге, то умрет. Думаю, надо ему помочь. Лекарство где-то в нижних туннелях шахты.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
