object FRegNtaS: TFRegNtaS
  Left = 113
  Top = 101
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Nota de Salida '
  ClientHeight = 572
  ClientWidth = 793
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 267
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    TabOrder = 0
    object Bevel1: TBevel
      Left = 6
      Top = 5
      Width = 780
      Height = 259
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 18
      Top = 9
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblNumNS: TLabel
      Left = 491
      Top = 52
      Width = 78
      Height = 15
      Caption = 'N'#186' Nota Salida'
    end
    object lblObs: TLabel
      Left = 398
      Top = 182
      Width = 151
      Height = 15
      Caption = 'Observaciones / Comentarios'
    end
    object Label2: TLabel
      Left = 584
      Top = 9
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object lblFReg: TLabel
      Left = 395
      Top = 52
      Width = 73
      Height = 15
      Caption = 'F. Nota Salida'
    end
    object lblTDocumento: TLabel
      Left = 20
      Top = 142
      Width = 132
      Height = 15
      Caption = 'Documento de Referencia'
    end
    object lblNDoc: TLabel
      Left = 270
      Top = 142
      Width = 73
      Height = 15
      Caption = 'N'#186' Documento'
      Enabled = False
    end
    object lblFDoc: TLabel
      Left = 24
      Top = 182
      Width = 89
      Height = 15
      Caption = 'Fecha Documento'
      Enabled = False
    end
    object lblSolic: TLabel
      Left = 118
      Top = 182
      Width = 57
      Height = 15
      Caption = 'Solicitante'
    end
    object lblTransacc: TLabel
      Left = 206
      Top = 51
      Width = 63
      Height = 15
      Caption = 'Transacci'#243'n'
    end
    object lblCC: TLabel
      Left = 581
      Top = 100
      Width = 85
      Height = 15
      Caption = 'Centro de Costos'
    end
    object lblProv: TLabel
      Left = 574
      Top = 51
      Width = 36
      Height = 15
      Caption = 'Cliente'
      Enabled = False
    end
    object Label7: TLabel
      Left = 18
      Top = 51
      Width = 97
      Height = 15
      Caption = 'Tipo de Documento'
    end
    object Bevel2: TBevel
      Left = 10
      Top = 94
      Width = 770
      Height = 9
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 206
      Top = 9
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object lblSerie: TLabel
      Left = 214
      Top = 142
      Width = 29
      Height = 15
      Caption = 'Serie'
      Enabled = False
    end
    object Label6: TLabel
      Left = 18
      Top = 220
      Width = 26
      Height = 15
      Caption = 'Obra'
    end
    object Label8: TLabel
      Left = 113
      Top = 220
      Width = 22
      Height = 15
      Caption = 'Lote'
    end
    object Label9: TLabel
      Left = 208
      Top = 220
      Width = 70
      Height = 15
      Caption = 'Packed Order'
    end
    object Label10: TLabel
      Left = 303
      Top = 220
      Width = 77
      Height = 15
      Caption = 'N'#250'mero Pedido'
    end
    object Label11: TLabel
      Left = 18
      Top = 99
      Width = 91
      Height = 15
      Caption = 'Localidad Destino'
    end
    object Label12: TLabel
      Left = 395
      Top = 100
      Width = 85
      Height = 15
      Caption = 'Almac'#233'n Destino'
    end
    object Label4: TLabel
      Left = 395
      Top = 9
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object Label5: TLabel
      Left = 208
      Top = 99
      Width = 89
      Height = 15
      Caption = 'Tipo Inv. Destino'
    end
    object lblTipPre: TLabel
      Left = 361
      Top = 142
      Width = 76
      Height = 14
      Caption = 'T. de Presupesto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblPresu: TLabel
      Left = 551
      Top = 142
      Width = 50
      Height = 14
      Caption = 'Presupesto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 18
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcNotInList
    end
    object Z2bbtnOK: TBitBtn
      Left = 740
      Top = 228
      Width = 28
      Height = 28
      Hint = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 39
      OnClick = Z2bbtnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnBorrar: TBitBtn
      Left = 739
      Top = 192
      Width = 28
      Height = 28
      Hint = 'Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 40
      Visible = False
      OnClick = Z2bbtnBorrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object dbeNumNISA: TwwDBEdit
      Left = 492
      Top = 68
      Width = 77
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'NISAID'
      DataSource = DMLOG.dsNIS
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumNISAExit
    end
    object dbmObs: TDBMemo
      Left = 398
      Top = 197
      Width = 327
      Height = 61
      DataField = 'NISAOBS'
      DataSource = DMLOG.dsNIS
      ScrollBars = ssVertical
      TabOrder = 38
      OnKeyPress = dbmObsKeyPress
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 584
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'25'#9'Descripci'#243'n'#9'F')
      DataField = 'ALMID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTALMEnter
      OnExit = dblcTALMExit
      OnNotInList = dblcNotInList
    end
    object dbdtpFNS: TwwDBDateTimePicker
      Left = 395
      Top = 68
      Width = 94
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFREG'
      DataSource = DMLOG.dsNIS
      Epoch = 1950
      ShowButton = True
      TabOrder = 12
      DisplayFormat = 'dd/mm/yyyy'
      OnExit = dbdtpFNSExit
    end
    object dbeNDoc: TwwDBEdit
      Left = 265
      Top = 158
      Width = 90
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISANDOC'
      DataSource = DMLOG.dsNIS
      Enabled = False
      TabOrder = 27
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFDoc: TwwDBDateTimePicker
      Left = 19
      Top = 198
      Width = 96
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFDOC'
      DataSource = DMLOG.dsNIS
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 32
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbeSolic: TwwDBEdit
      Left = 118
      Top = 198
      Width = 275
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISASOLIC'
      DataSource = DMLOG.dsNIS
      TabOrder = 33
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdTDOC: TwwDBLookupComboDlg
      Left = 20
      Top = 158
      Width = 49
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Documento de Referencia ...'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'DOCID'#9'2'#9'C'#243'digo'#9'F'
        'DOCDES'#9'30'#9'Detalle'#9'F')
      DataField = 'DOCID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsTDOC
      LookupField = 'DOCID'
      MaxLength = 2
      TabOrder = 24
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdTDOCExit
    end
    object dblcTransac: TwwDBLookupCombo
      Left = 206
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TRIID'#9'2'#9'C'#243'digo'#9'F'
        'TRIDES'#9'40'#9'Descripci'#243'n'#9'F'
        'TRIABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TRIID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsTRAN
      LookupField = 'TRIID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTransacEnter
      OnExit = dblcTransacExit
      OnNotInList = dblcNotInList
    end
    object dbeTransac: TwwDBEdit
      Left = 257
      Top = 68
      Width = 135
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 584
      Top = 117
      Width = 66
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Centro de Costos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'8'#9'C'#243'digo'#9'F'
        'CCOSDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsCCost
      LookupField = 'CCOSID'
      Enabled = False
      TabOrder = 22
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCExit
    end
    object dbeCC: TwwDBEdit
      Left = 651
      Top = 117
      Width = 124
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 575
      Top = 68
      Width = 81
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CLIEID'#9'8'#9'CLIEID'#9'F'
        'CLIEDES'#9'40'#9'CLIEDES'#9'F'
        'CLIEABR'#9'15'#9'CLIEABR'#9'F'
        'CLIERUC'#9'10'#9'CLIERUC'#9'F')
      DataField = 'PROV'
      DataSource = DMLOG.dsNIS
      LookupField = 'CLIEID'
      Enabled = False
      MaxLength = 8
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeProv: TwwDBEdit
      Left = 660
      Top = 68
      Width = 113
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTDA: TwwDBLookupCombo
      Left = 18
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDAID'#9'2'#9'C'#243'digo'#9'F'
        'TDADES'#9'40'#9'Descripci'#243'n'#9'F'
        'TDAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TDAID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsTDNISA
      LookupField = 'TDAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTDAExit
      OnNotInList = dblcNotInList
    end
    object dbeTDNISA: TwwDBEdit
      Left = 69
      Top = 68
      Width = 135
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 206
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'LOCID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcLOCEnter
      OnExit = dblcLOCExit
      OnNotInList = dblcNotInList
    end
    object dbeSerie: TwwDBEdit
      Left = 211
      Top = 158
      Width = 49
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISASERIE'
      DataSource = DMLOG.dsNIS
      Enabled = False
      TabOrder = 26
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object deObra: TwwDBEdit
      Left = 18
      Top = 236
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISAOBRA'
      DataSource = DMLOG.dsNIS
      TabOrder = 34
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 113
      Top = 236
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISALOTE'
      DataSource = DMLOG.dsNIS
      TabOrder = 35
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePO: TwwDBEdit
      Left = 208
      Top = 236
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISPORD'
      DataSource = DMLOG.dsNIS
      TabOrder = 36
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNP: TwwDBEdit
      Left = 303
      Top = 236
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISNPED'
      DataSource = DMLOG.dsNIS
      TabOrder = 37
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcLOCOri: TwwDBLookupCombo
      Left = 18
      Top = 117
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCORIID'
      DataSource = DMLOG.dsNIS
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcLOCOriExit
      OnNotInList = dblcNotInList
    end
    object dblcTALMOri: TwwDBLookupCombo
      Left = 395
      Top = 117
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMORIID'
      DataSource = DMLOG.dsNIS
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 20
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTALMOriEnter
      OnExit = dblcTALMOriExit
      OnNotInList = dblcNotInList
    end
    object dbeDOCS: TEdit
      Left = 71
      Top = 158
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 25
    end
    object dblcTInv: TwwDBLookupCombo
      Left = 395
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TINID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTInvEnter
      OnExit = dblcTInvExit
      OnNotInList = dblcNotInList
    end
    object dbeCIA: TEdit
      Left = 69
      Top = 26
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbeLOC: TEdit
      Left = 257
      Top = 26
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dbeTinv: TEdit
      Left = 445
      Top = 26
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dbeALM: TEdit
      Left = 635
      Top = 26
      Width = 139
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dblcTINOri: TwwDBLookupCombo
      Left = 206
      Top = 117
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TINORIID'
      DataSource = DMLOG.dsNIS
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 18
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTINOriEnter
      OnExit = dblcTINOriExit
      OnNotInList = dblcNotInList
    end
    object dbeALMOri: TEdit
      Left = 446
      Top = 117
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 21
    end
    object dbeTINOri: TEdit
      Left = 257
      Top = 117
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 19
    end
    object dbeLOCOri: TEdit
      Left = 68
      Top = 117
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 17
    end
    object dblcTipPre: TwwDBLookupCombo
      Left = 361
      Top = 158
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPPRESID'#9'2'#9'C'#243'digo'#9'F'
        'TIPPRESDES'#9'20'#9'Descripci'#243'n'#9'F')
      DataField = 'TIPPRESID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsTipPre
      LookupField = 'TIPPRESID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      MaxLength = 2
      TabOrder = 28
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTipPreExit
    end
    object dbeTipPre: TwwDBEdit
      Left = 409
      Top = 158
      Width = 137
      Height = 23
      DataField = 'TIPPRESDES'
      Enabled = False
      ReadOnly = True
      TabOrder = 29
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdPresup: TwwDBLookupComboDlg
      Left = 551
      Top = 158
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PARPRESID'#9'15'#9'ID'#9'F'
        'PARPRESDES'#9'30'#9'Partida presupuestal'#9'F'
        'PARPRES_IS'#9'3'#9'I/E'#9'F')
      DataField = 'PARPRESID'
      DataSource = DMLOG.dsNIS
      LookupTable = DMLOG.cdsParPre
      LookupField = 'PARPRESID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 12
      TabOrder = 30
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdPresupExit
    end
    object edtPresup: TEdit
      Left = 643
      Top = 158
      Width = 137
      Height = 23
      Enabled = False
      TabOrder = 31
    end
  end
  object pnlDetalleG: TPanel
    Left = 0
    Top = 269
    Width = 792
    Height = 303
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 14869218
    TabOrder = 1
    object lblEstado: TLabel
      Left = 361
      Top = 271
      Width = 70
      Height = 23
      Caption = 'lblEstado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDReqs: TwwDBGrid
      Left = 5
      Top = 23
      Width = 782
      Height = 240
      DisableThemesInTitle = False
      Selected.Strings = (
        'KDXID'#9'8'#9'N'#186
        'ARTID'#9'10'#9'C'#243'digo~Art'#237'culo'
        'ARTDES'#9'45'#9'Detalle'
        'KDXPEDIDOG'#9'9'#9'C.Pedida~U/Med G,'
        'KDXCNTG'#9'9'#9'C.Atendida~U/Med.G'
        'KDXPEDIDOU'#9'9'#9'C.Pedida~U/Med U.'
        'KDXCNTU'#9'9'#9'C.Atendida~U/Med.U'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = DMLOG.dsKDX
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgDReqsDblClick
      OnKeyDown = dbgDReqsKeyDown
      object Z2dbgDReqsIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 30
        AllowAllUp = True
        Glyph.Data = {
          96010000424D9601000000000000760000002800000017000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
          BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
          FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
          88B08888888888888888888888B08888888888888888888888B0}
        OnClick = Z2dbgDReqsIButtonClick
      end
    end
    object stxTitulo1: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Salida'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Z2bbtnAceptar: TBitBtn
      Left = 646
      Top = 268
      Width = 29
      Height = 30
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnAceptarClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object Z2bbtnRegresa: TBitBtn
      Left = 559
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnRegresaClick
      Glyph.Data = {
        9A050000424D9A05000000000000360000002800000014000000170000000100
        1800000000006405000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFCCCCCC00000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
        CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
        9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
        00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
        000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
        6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
        6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
        99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
        666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
        0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
        FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
        0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object Z2bbtnCanc2: TBitBtn
      Left = 679
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Cancela Actualizaciones del Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnCanc2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033911833333333333333333F333333333333
        0000339111833333911333333388F333333F3333000033911118333911118333
        38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003339
        1118333911183333338F33838F338F33000033911183333391118333338FF833
        38F338F300003391183333333911133333388333338FFF830000333913333333
        3391833333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnGraba: TBitBtn
      Left = 609
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Z2bbtnGrabaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        0400000000001401000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object Z2bbtnNuevo: TBitBtn
      Left = 712
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Nueva Nota de Salida'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Z2bbtnNuevoClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000017000000180000000100
        0400000000002001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
        FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
        88B08888888888888888888888B08888888888888888888888B0}
    end
  end
  object pnlDetalleA: TPanel
    Left = 100
    Top = 347
    Width = 594
    Height = 179
    Color = 14869218
    TabOrder = 2
    Visible = False
    object bvlDetalle: TBevel
      Left = 5
      Top = 21
      Width = 585
      Height = 123
      Shape = bsFrame
    end
    object lblItem: TLabel
      Left = 14
      Top = 25
      Width = 14
      Height = 15
      Caption = 'N'#186
      Transparent = True
    end
    object lblArti: TLabel
      Left = 64
      Top = 27
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object lblCntS: TLabel
      Left = 246
      Top = 71
      Width = 94
      Height = 15
      Caption = 'Cantidad Atendida'
      Transparent = True
    end
    object Label1: TLabel
      Left = 132
      Top = 70
      Width = 82
      Height = 15
      Caption = 'Cantidad Pedida'
      Transparent = True
    end
    object lblMedGnrl: TLabel
      Left = 9
      Top = 88
      Width = 81
      Height = 15
      Caption = 'Medida General'
      Transparent = True
    end
    object lblMedUni: TLabel
      Left = 11
      Top = 115
      Width = 84
      Height = 15
      Caption = 'Medida Unitaria'
      Transparent = True
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 497
      Top = 146
      Width = 29
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnRegOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnRegCanc: TBitBtn
      Left = 529
      Top = 146
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbeItem: TwwDBEdit
      Left = 14
      Top = 44
      Width = 47
      Height = 23
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeArti: TwwDBEdit
      Left = 177
      Top = 44
      Width = 376
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 64
      Top = 44
      Width = 111
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'Articulo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ARTABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ARTID'
      LookupField = 'ARTID'
      SeqSearchOptions = []
      MaxLength = 15
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dbcldArtiExit
    end
    object dbeCantidadG: TwwDBEdit
      Left = 242
      Top = 88
      Width = 110
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantidadGExit
    end
    object dbePedidoG: TwwDBEdit
      Left = 131
      Top = 88
      Width = 110
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo2: TPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Salida'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object dbePedidoU: TwwDBEdit
      Left = 131
      Top = 115
      Width = 110
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCantidadU: TwwDBEdit
      Left = 242
      Top = 115
      Width = 110
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantidadGExit
    end
    object chkBxAtendido: TCheckBox
      Left = 416
      Top = 100
      Width = 117
      Height = 17
      Caption = 'Dar por Atendido'
      TabOrder = 10
    end
  end
  object pnlActuali: TPanel
    Left = 304
    Top = 331
    Width = 185
    Height = 57
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = 14869218
    Enabled = False
    TabOrder = 3
    Visible = False
    object lblActuali: TLabel
      Left = 2
      Top = 2
      Width = 177
      Height = 49
      Align = alClient
      Alignment = taCenter
      Caption = 'Actualizando...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
  object Z2bbtnSalir: TBitBtn
    Left = 746
    Top = 537
    Width = 32
    Height = 30
    Hint = 'Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Z2bbtnSalirClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object Z2bbtnPrint: TBitBtn
    Left = 521
    Top = 537
    Width = 32
    Height = 30
    Hint = 'Emitir Orden de Compra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Z2bbtnPrintClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object pnlActualizando: TPanel
    Left = 284
    Top = 293
    Width = 161
    Height = 65
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 6
    Visible = False
    object lblActualizando: TLabel
      Left = 4
      Top = 4
      Width = 149
      Height = 53
      Align = alClient
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object ppDBCab: TppDBPipeline
    UserName = 'DBCab'
    Left = 536
    Top = 38
  end
  object ppdbOC: TppDBPipeline
    UserName = 'dbOC'
    Left = 606
    Top = 37
  end
  object pprNisSal: TppReport
    AutoStop = False
    DataPipeline = ppdbOC
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rNisSal'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 350
    PrinterSetup.mmMarginRight = 350
    PrinterSetup.mmMarginTop = 350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SOLAlmacen\SOLFormatos\NisaSal.rtm'
    Template.SaveTo = stDatabase
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprNisSalPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 678
    Top = 37
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbOC'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 76200
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 6085
        mmLeft = 794
        mmTop = 70115
        mmWidth = 205846
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'NISASOLIC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 53181
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'NISAID'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 5292
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'NISAFREG'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 10583
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 34131
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Almac'#233'n Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 40481
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'A Solicitud de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 53181
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157957
        mmTop = 5292
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 10583
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Guia de Salida de Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 69056
        mmTop = 22225
        mmWidth = 71173
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Departamento de Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4498
        mmLeft = 5027
        mmTop = 15610
        mmWidth = 84402
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 70644
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'D E S C R I P C I O N '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 70644
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'U.M.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 70644
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label202'
        Caption = 'CANT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 173832
        mmTop = 70644
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ALMDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 34131
        mmWidth = 100000
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ALMDESORI'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 40481
        mmWidth = 100000
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Observacione'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 60325
        mmWidth = 22225
        BandType = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'NISAOBS'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 8202
        mmLeft = 36248
        mmTop = 60325
        mmWidth = 156369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Pag.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 154252
        mmTop = 15346
        mmWidth = 7408
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 15346
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 70644
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 7673
        mmLeft = 5027
        mmTop = 5292
        mmWidth = 104246
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'TRIDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 29104
        mmWidth = 209286
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Transacci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 46831
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'TRIDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 46831
        mmWidth = 100000
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 75000
      object ppDBText4: TppDBText
        UserName = 'DBText7'
        DataField = 'KDXID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ARTID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ARTDES'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 44979
        mmTop = 0
        mmWidth = 97102
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'UNMABR'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 154782
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'KDXCNT'
        DataPipeline = ppdbOC
        DisplayFormat = '### ###,###.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 174096
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 45244
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 21696
        mmTop = 5821
        mmWidth = 58473
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 126471
        mmTop = 5556
        mmWidth = 58473
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Entregado por Almacen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 30427
        mmTop = 7144
        mmWidth = 38894
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'C. C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 130175
        mmTop = 11377
        mmWidth = 9260
        BandType = 8
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'NISASOLIC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 11377
        mmWidth = 40746
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Recibido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 6085
        mmWidth = 14817
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 207000
    end
  end
end
