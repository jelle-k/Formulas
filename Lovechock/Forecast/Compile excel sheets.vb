Sub a()
'
' a Macro
'

'
    'First Cell'
    Range("A1").Select
    
    'Copy NLBE'
    Workbooks.Open("S:\Forecast\Forecast V2\Export from SAP\1.NLBE.xls",ReadOnly).Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    ActiveWindow.SmallScroll Down:=6
    Selection.Copy

    'Paste NLBE'
    Windows("Master.xlsx").Activate
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    ActiveCell.SpecialCells(xlLastCell).Select
    Selection.End(xlToLeft).Select
    
    'Copy INDIR'
    Workbooks.Open("S:\Forecast\Forecast V2\Export from SAP\2.INDIR.xls",ReadOnly).Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    Application.CutCopyMode = False
    Selection.Copy
    
    'Paste INDIR'
    Windows("Master.xlsx").Activate
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    ActiveCell.SpecialCells(xlLastCell).Select
    Selection.End(xlToLeft).Select
    
    'Copy DACHL'
    Workbooks.Open("S:\Forecast\Forecast V2\Export from SAP\3.DACHL.xls",ReadOnly).Activate
    Range("A1").Select
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    Application.CutCopyMode = False
    Selection.Copy
    
    'Paste DACHL'
    Windows("Master.xlsx").Activate
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Range("A1").Select
    Application.CutCopyMode = False
    ActiveWorkbook.Save
    ActiveWindow.Close
    ActiveWindow.Close
    ActiveWindow.Close
    ActiveWindow.Close
End Sub