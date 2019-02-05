object FRptOrdenPago: TFRptOrdenPago
  Left = 374
  Top = 224
  Width = 433
  Height = 274
  Caption = 'Reporte de Orden de Pago'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 16
    Top = 114
    Width = 395
    Height = 84
    Caption = 'Orden de Pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object Label5: TLabel
      Left = 7
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Compa'#241#237'a :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 46
      Width = 44
      Height = 13
      Caption = 'Fecha :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 82
      Top = 48
      Width = 35
      Height = 13
      Caption = 'desde :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 206
      Top = 48
      Width = 32
      Height = 13
      Caption = 'hasta :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 10
    Width = 398
    Height = 100
    Caption = 'Orden de Compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 66
      Height = 13
      Caption = 'Compa'#241#237'a :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 52
      Height = 13
      Caption = 'N'#250'mero :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 44
      Height = 13
      Caption = 'Fecha :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 82
      Top = 72
      Width = 35
      Height = 13
      Caption = 'desde :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 206
      Top = 72
      Width = 32
      Height = 13
      Caption = 'hasta :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Z2bbtnImprime: TBitBtn
    Left = 380
    Top = 200
    Width = 30
    Height = 30
    Hint = 'Activos Fijos Comprados Recientemente'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Z2bbtnImprimeClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 88
    Top = 28
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaExit
  end
  object dblcCompania_des: TEdit
    Left = 141
    Top = 28
    Width = 263
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    Enabled = False
    TabOrder = 2
  end
  object edtNumeroOC: TEdit
    Left = 88
    Top = 52
    Width = 129
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    TabOrder = 3
  end
  object dbdtpDesdeOC: TwwDBDateTimePicker
    Left = 137
    Top = 79
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 4
  end
  object dbdtpHastaOC: TwwDBDateTimePicker
    Left = 254
    Top = 79
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 5
  end
  object dblcCompaniaOP: TwwDBLookupCombo
    Left = 88
    Top = 132
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaOPExit
  end
  object dblcCompaniaOP_des: TEdit
    Left = 140
    Top = 132
    Width = 263
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    Enabled = False
    TabOrder = 7
  end
  object dbdtpDesdeOP: TwwDBDateTimePicker
    Left = 139
    Top = 158
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 8
  end
  object dbdtpHastaOP: TwwDBDateTimePicker
    Left = 259
    Top = 158
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 9
  end
  object ppDBPipeline_OrdenPago: TppDBPipeline
    UserName = 'DBPipeline_OrdenPago'
    Left = 16
    Top = 208
  end
  object ppReport_OrdenPago: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline_OrdenPago
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\LOG\Dema\RptOrdenPago.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 48
    Top = 208
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline_OrdenPago'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDesigner_OrdenPago: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 80
    Top = 208
  end
end
