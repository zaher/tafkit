Attribute VB_Name = "ArabicFigures"
Function ArFigure(Number As String) As String
    Dim F As New ArFigures.Figure
    ArFigure = F.Simple(Number, "", "", 2, False)
End Function

