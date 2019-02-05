object fTicketHistorico: TfTicketHistorico
  Left = 564
  Top = 187
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Texto Ticket Hist'#243'rico'
  ClientHeight = 266
  ClientWidth = 495
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
  object Label1: TLabel
    Left = 17
    Top = 8
    Width = 87
    Height = 20
    Caption = 'Busqueda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 40
    Width = 476
    Height = 184
    Caption = 'Hist'#243'rico :'
    TabOrder = 0
    object dbgHistorico: TwwDBGrid
      Left = 10
      Top = 19
      Width = 455
      Height = 155
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbgHistoricoDblClick
    end
  end
  object IBuscar: TwwIncrementalSearch
    Left = 112
    Top = 9
    Width = 369
    Height = 21
    DataSource = DMLOG.dsQry3
    TabOrder = 1
  end
  object btnSalir: TBitBtn
    Left = 430
    Top = 232
    Width = 54
    Height = 25
    Caption = 'Salir'
    TabOrder = 2
    OnClick = btnSalirClick
  end
end
