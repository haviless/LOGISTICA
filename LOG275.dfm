object FreferenciaOT: TFreferenciaOT
  Left = 159
  Top = 258
  BorderStyle = bsDialog
  Caption = 'Seleccione Referencia'
  ClientHeight = 274
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgReferencia: TwwDBGrid
    Left = 9
    Top = 11
    Width = 696
    Height = 223
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clSkyBlue
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    FooterColor = clActiveCaption
  end
  object BitBtn1: TBitBtn
    Left = 13
    Top = 242
    Width = 140
    Height = 25
    Caption = 'Seleciona Proforma'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
