SELECT MID({FCT1.ItemCode},2,1)
	CASE "1":
        ({FCT1.Quantity}*21)/12
    DEFAULT :
        {FCT1.Quantity}
