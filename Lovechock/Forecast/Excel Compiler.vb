Sub Compiler()
'
' a Macro
'

'
    'Open Documents
    Workbooks.Open Filename:= "S:\Forecast\Forecast V2\Export from SAP\3.DACHL.xls"
    Workbooks.Open Filename:="S:\Forecast\Forecast V2\Export from SAP\1.NLBE.xls"
    Workbooks.Open Filename:= "S:\Forecast\Forecast V2\Export from SAP\2.INDIR.xls"
    
    'Select All from NLBE'
    Windows("1.NLBE.xls").Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    'Copy All from NLBE'
    Selection.Copy
    Windows("Data_1.xls").Activate
    Range("A1").Select
    'Paste All from NLBE'
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks :=False, Transpose:=False
    ActiveCell.SpecialCells(xlLastCell).Select
    Selection.End(xlToLeft).Select
    'Down One Row'
    ActiveCell.Offset(1).Select 
    

    'Select All from INDIR'
    Windows("2.INDIR.xls").Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    Application.CutCopyMode = False
    'Copy All from INDIR'
    Selection.Copy
    Windows("Data_1.xls").Activate
    'Paste All from INDIR'
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks :=False, Transpose:=False
    ActiveCell.SpecialCells(xlLastCell).Select
    Selection.End(xlToLeft).Select
    'Down One Row'
    ActiveCell.Offset(1).Select 
    

    'Select All from DACHL'
    Windows("3.DACHL.xls").Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    Application.CutCopyMode = False
    'Copy All from DACHL'
    Selection.Copy
    Windows("Data_1.xls").Activate
    'Past All from DACHL'
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks :=False, Transpose:=False
    Range("A1").Select
    Application.CutCopyMode = False

    'Close all windows'
    ActiveWorkbook.Save
    ActiveWindow.Close
    ActiveWindow.Close
    ActiveWindow.Close
    ActiveWindow.Close
End Sub
