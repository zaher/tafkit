object MainForm: TMainForm
  Left = 192
  Top = 108
  BiDiMode = bdRightToLeft
  BorderStyle = bsDialog
  Caption = #1578#1601#1602#1610#1591
  ClientHeight = 291
  ClientWidth = 341
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  DesignSize = (
    341
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 190
    Width = 91
    Height = 65
    Anchors = [akTop, akRight]
    Caption = 
      #1578#1601#1602#1610#1591' '#1610#1585#1575#1593#1610' '#1575#1604#1578#1584#1603#1610#1585' '#1608' '#1575#1604#1578#1571#1606#1610#1579' '#1608' '#1575#1604#1573#1593#1585#1575#1576' '#1576#1575#1604#1604#1594#1577' '#1575#1604#1593#1585#1576#1610#1577' '#1548' '#1604#1575#1581#1592' '#1603#1610 +
      #1601' '#1610#1582#1578#1604#1601' '#1575#1604#1583#1608#1604#1575#1585' '#1593#1606' '#1575#1604#1604#1610#1585#1577
    WordWrap = True
  end
  object Label2: TLabel
    Left = 197
    Top = 163
    Width = 27
    Height = 13
    Caption = #1605#1578#1591#1608#1585
  end
  object Label3: TLabel
    Left = 197
    Top = 28
    Width = 26
    Height = 13
    Caption = #1593#1575#1583#1610
  end
  object Edit1: TEdit
    Left = 2
    Top = 2
    Width = 146
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 2
    Top = 44
    Width = 226
    Height = 115
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 150
    Top = 3
    Width = 75
    Height = 20
    Caption = #1578#1601#1602#1610#1591
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 234
    Top = 6
    Width = 107
    Height = 56
    Anchors = [akTop, akRight]
    Caption = #1575#1604#1593#1605#1604#1577
    ItemIndex = 0
    Items.Strings = (
      #1604#1610#1585#1577
      #1583#1608#1604#1575#1585)
    TabOrder = 3
  end
  object Memo2: TMemo
    Left = 3
    Top = 180
    Width = 226
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
end
