VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4755
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6480
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   4755
   ScaleWidth      =   6480
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox PartNameEdit 
      Height          =   375
      Left            =   4080
      TabIndex        =   8
      Text            =   "ﬁ—‘"
      Top             =   360
      Width           =   2055
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Simple"
      Height          =   495
      Left            =   4320
      TabIndex        =   7
      Top             =   1920
      Width           =   1575
   End
   Begin VB.TextBox NumberEdit 
      Height          =   375
      Left            =   840
      TabIndex        =   6
      Text            =   "155410151"
      Top             =   240
      Width           =   2655
   End
   Begin VB.TextBox PluralEdit 
      Height          =   375
      Left            =   840
      TabIndex        =   5
      Text            =   "·Ì—« "
      Top             =   2160
      Width           =   2655
   End
   Begin VB.TextBox Dual2Edit 
      Height          =   375
      Left            =   840
      TabIndex        =   4
      Text            =   "·Ì— «‰"
      Top             =   1680
      Width           =   2655
   End
   Begin VB.TextBox Dual1Edit 
      Height          =   375
      Left            =   840
      TabIndex        =   3
      Text            =   "·Ì— Ì‰"
      Top             =   1200
      Width           =   2655
   End
   Begin VB.TextBox CurrencyNameEdit 
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Text            =   "·Ì—…"
      Top             =   720
      Width           =   2655
   End
   Begin VB.CommandButton FigureBtn 
      Caption         =   "Extended"
      Height          =   495
      Left            =   4320
      TabIndex        =   1
      Top             =   1200
      Width           =   1575
   End
   Begin VB.TextBox ResultEdit 
      Height          =   1575
      Left            =   840
      MultiLine       =   -1  'True
      RightToLeft     =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   2640
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim Figure As ArFigures.Figure
    Set Figure = New ArFigures.Figure
    ResultEdit.Text = Figure.Simple(NumberEdit.Text, CurrencyNameEdit.Text, PartNameEdit.Text, 2, True)
End Sub

Private Sub FigureBtn_Click()
    Dim Figure As ArFigures.Figure
    Set Figure = New ArFigures.Figure
    ResultEdit.Text = Figure.Extended(NumberEdit.Text, CurrencyNameEdit.Text, Dual1Edit.Text, Dual2Edit.Text, PluralEdit.Text, True)
End Sub
