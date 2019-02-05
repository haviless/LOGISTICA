object FMaesProv: TFMaesProv
  Left = 253
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Maestro de Proovedores'
  ClientHeight = 575
  ClientWidth = 755
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
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
  object Panel1: TPanel
    Left = 10
    Top = 9
    Width = 735
    Height = 558
    Color = 14869218
    TabOrder = 0
    object pcMaestro: TPageControl
      Left = 8
      Top = 10
      Width = 718
      Height = 541
      ActivePage = tbshMaestro
      TabOrder = 0
      OnEnter = pcMaestroEnter
      object tbshMaestro: TTabSheet
        Caption = 'Maestro de Proveedores'
        object Panel3: TPanel
          Left = 8
          Top = 8
          Width = 696
          Height = 494
          BorderStyle = bsSingle
          Color = 14869218
          TabOrder = 0
          object Label4: TLabel
            Left = 315
            Top = 192
            Width = 43
            Height = 15
            Caption = 'EMail(s)'
          end
          object Label7: TLabel
            Left = 322
            Top = 289
            Width = 89
            Height = 15
            Caption = 'Compra Max.( $ )'
          end
          object Label8: TLabel
            Left = 426
            Top = 289
            Width = 86
            Height = 15
            Caption = 'Compra Min ( $ )'
          end
          object Label10: TLabel
            Left = 8
            Top = 106
            Width = 67
            Height = 15
            Caption = 'Raz'#243'n Social'
          end
          object Label11: TLabel
            Left = 9
            Top = 241
            Width = 51
            Height = 15
            Caption = 'Direcci'#243'n'
          end
          object Label13: TLabel
            Left = 8
            Top = 192
            Width = 51
            Height = 15
            Caption = 'Tel'#233'fonos'
          end
          object Label14: TLabel
            Left = 170
            Top = 192
            Width = 19
            Height = 15
            Caption = 'Fax'
          end
          object Label18: TLabel
            Left = 531
            Top = 289
            Width = 96
            Height = 15
            AutoSize = False
            Caption = 'Sector Econ'#243'mico'
            WordWrap = True
          end
          object Label21: TLabel
            Left = 178
            Top = 393
            Width = 71
            Height = 15
            Caption = 'Departamento'
          end
          object Label22: TLabel
            Left = 350
            Top = 393
            Width = 49
            Height = 15
            Caption = 'Provincia'
          end
          object Label23: TLabel
            Left = 518
            Top = 393
            Width = 40
            Height = 15
            Caption = 'Distrito'
          end
          object Label25: TLabel
            Left = 165
            Top = 11
            Width = 90
            Height = 15
            Caption = 'C'#243'digo Proveedor'
          end
          object Label26: TLabel
            Left = 430
            Top = 106
            Width = 62
            Height = 15
            Caption = 'Abreviatura'
          end
          object Label27: TLabel
            Left = 265
            Top = 11
            Width = 31
            Height = 15
            Caption = 'R.U.C.'
          end
          object Label28: TLabel
            Left = 9
            Top = 341
            Width = 40
            Height = 15
            Caption = 'Girador'
          end
          object Label29: TLabel
            Left = 9
            Top = 393
            Width = 21
            Height = 15
            Caption = 'Pais'
          end
          object Label3: TLabel
            Left = 339
            Top = 343
            Width = 73
            Height = 15
            Caption = 'Representante'
          end
          object Label5: TLabel
            Left = 315
            Top = 243
            Width = 71
            Height = 15
            Caption = 'Lugar de Pago'
          end
          object Label1: TLabel
            Left = 9
            Top = 12
            Width = 73
            Height = 15
            Caption = 'Clase Auxiliar'
          end
          object Label9: TLabel
            Left = 9
            Top = 288
            Width = 23
            Height = 15
            Caption = 'Giro'
          end
          object Label12: TLabel
            Left = 160
            Top = 290
            Width = 80
            Height = 15
            Caption = 'Clasificaciones'
          end
          object Label16: TLabel
            Left = 391
            Top = 11
            Width = 32
            Height = 15
            Caption = 'D.N.I.'
          end
          object Label17: TLabel
            Left = 517
            Top = 11
            Width = 81
            Height = 15
            Caption = 'Tipo de Persona'
          end
          object Label19: TLabel
            Left = 8
            Top = 60
            Width = 45
            Height = 15
            Caption = 'Nombres'
          end
          object Label20: TLabel
            Left = 279
            Top = 60
            Width = 84
            Height = 15
            Caption = 'Apellido Paterno'
          end
          object Label24: TLabel
            Left = 481
            Top = 60
            Width = 88
            Height = 15
            Caption = 'Apellido Materno'
          end
          object Label30: TLabel
            Left = 556
            Top = 106
            Width = 82
            Height = 15
            Caption = 'N'#186' Exoneracion'
          end
          object Label40: TLabel
            Left = 9
            Top = 149
            Width = 94
            Height = 15
            Caption = 'Nombre Comercial'
          end
          object Label44: TLabel
            Left = 10
            Top = 441
            Width = 63
            Height = 15
            Caption = 'Procedencia'
          end
          object dbeProv: TwwDBEdit
            Left = 164
            Top = 27
            Width = 95
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROV'
            DataSource = DMLOG.dsProv
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeProvExit
          end
          object dbeRazSoc: TwwDBEdit
            Left = 7
            Top = 122
            Width = 416
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVDES'
            DataSource = DMLOG.dsProv
            TabOrder = 10
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeRazSocExit
          end
          object dbeAbr: TwwDBEdit
            Left = 429
            Top = 122
            Width = 123
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVABR'
            DataSource = DMLOG.dsProv
            TabOrder = 11
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeTelef: TwwDBEdit
            Left = 8
            Top = 209
            Width = 140
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVTELF'
            DataSource = DMLOG.dsProv
            TabOrder = 14
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeFax: TwwDBEdit
            Left = 162
            Top = 209
            Width = 140
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVFAX'
            DataSource = DMLOG.dsProv
            TabOrder = 15
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeMail: TwwDBEdit
            Left = 314
            Top = 209
            Width = 365
            Height = 23
            DataField = 'PROVEMAI'
            DataSource = DMLOG.dsProv
            TabOrder = 16
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeRuc: TwwDBEdit
            Left = 262
            Top = 27
            Width = 123
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVRUC'
            DataSource = DMLOG.dsProv
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeRucExit
          end
          object dbeDirCom: TwwDBEdit
            Left = 9
            Top = 258
            Width = 294
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVDIR'
            DataSource = DMLOG.dsProv
            TabOrder = 17
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeGirador: TwwDBEdit
            Left = 9
            Top = 358
            Width = 310
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVGIRA'
            DataSource = DMLOG.dsProv
            TabOrder = 27
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeRepre: TwwDBEdit
            Left = 339
            Top = 358
            Width = 338
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVREPR'
            DataSource = DMLOG.dsProv
            TabOrder = 28
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcPais: TwwDBLookupCombo
            Left = 9
            Top = 408
            Width = 45
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PAISID'#9'3'#9'Id'#9'F'
              'PAISDES'#9'30'#9'Pais'#9'F')
            DataField = 'PAISID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsPais
            LookupField = 'PAISID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 29
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcPaisExit
          end
          object dblcDeparta: TwwDBLookupCombo
            Left = 178
            Top = 408
            Width = 45
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DPTOID'#9'3'#9'Id'#9'F'
              'DPTODES'#9'30'#9'Departamento'#9'F')
            DataField = 'DPTOID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsDpto
            LookupField = 'DPTOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 31
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcDepartaExit
          end
          object dblcProvinc: TwwDBLookupCombo
            Left = 349
            Top = 408
            Width = 45
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CIUDID'#9'3'#9'Id'#9'F'
              'CIUDDES'#9'30'#9'Descripci'#243'n'#9'F')
            DataField = 'CIUDID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsProvinc
            LookupField = 'CIUDID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 33
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcProvincExit
          end
          object dblcDistrito: TwwDBLookupCombo
            Left = 517
            Top = 408
            Width = 45
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'ZIPID'#9'3'#9'Id'#9'F'
              'ZIPDES'#9'35'#9'Distrito'#9'F')
            DataField = 'PROVCZIP'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsDistrito
            LookupField = 'ZIPID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 35
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcDistritoExit
          end
          object dbeMax: TwwDBEdit
            Left = 322
            Top = 307
            Width = 90
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVCOMMAX'
            DataSource = DMLOG.dsProv
            TabOrder = 23
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeMin: TwwDBEdit
            Left = 426
            Top = 307
            Width = 90
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVCOMMIN'
            DataSource = DMLOG.dsProv
            TabOrder = 24
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcSecEco: TwwDBLookupCombo
            Left = 529
            Top = 307
            Width = 41
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SECECOID'#9'2'#9'Id'#9'F'
              'SECECODES'#9'30'#9'Sector Economico'#9'F')
            DataField = 'SECECOID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsSecEco
            LookupField = 'SECECOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 25
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcSecEcoExit
          end
          object Z2bbtnOK: TBitBtn
            Left = 574
            Top = 439
            Width = 30
            Height = 31
            Hint = 'Pasa a Registrar Detalle'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 37
            OnClick = Z2bbtnOKClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
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
          object Z2bbtnCancel: TBitBtn
            Left = 609
            Top = 439
            Width = 30
            Height = 31
            Hint = 'Reinicia Comprobante'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 38
            OnClick = Z2bbtnCancelClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
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
          object dbeLugPag: TwwDBEdit
            Left = 313
            Top = 258
            Width = 365
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVLUGPAG'
            DataSource = DMLOG.dsProv
            TabOrder = 18
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcClAux: TwwDBLookupCombo
            Left = 8
            Top = 27
            Width = 49
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CLAUXID'#9'2'#9'Id.'#9'F'
              'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
            DataField = 'CLAUXID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsClAux
            LookupField = 'CLAUXID'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 15
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcClAuxExit
            OnNotInList = dblcClAuxNotInList
          end
          object dblcGiro: TwwDBLookupCombo
            Left = 9
            Top = 307
            Width = 40
            Height = 23
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'GIROID'#9'2'#9'Id'#9'F'
              'GIRODES'#9'40'#9'Giro de la Empresa'#9'F')
            DataField = 'GIROID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsGiro
            LookupField = 'GIROID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 19
            AutoDropDown = False
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcGiroExit
          end
          object dblcClasif: TwwDBLookupCombo
            Left = 159
            Top = 307
            Width = 40
            Height = 23
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CLASIFID'#9'1'#9'Id'#9'F'
              'CLASIFDES'#9'40'#9'Clasificaci'#243'n del Cliente'#9'F')
            DataField = 'CLASIFID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsClasif
            LookupField = 'CLASIFID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 21
            AutoDropDown = False
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcClasifExit
          end
          object Z2bbtnNuevo: TBitBtn
            Left = 645
            Top = 439
            Width = 30
            Height = 31
            Hint = 'Nuevo Registro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Garamond'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = Z2bbtnNuevoClick
            Glyph.Data = {
              96010000424D9601000000000000760000002800000017000000180000000100
              04000000000020010000CE0E0000D80E00001000000000000000000000000000
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
          object dbeClAux: TEdit
            Left = 59
            Top = 27
            Width = 102
            Height = 23
            Enabled = False
            TabOrder = 1
          end
          object dbeGiro: TEdit
            Left = 54
            Top = 307
            Width = 94
            Height = 23
            Enabled = False
            TabOrder = 20
          end
          object dbeClasif: TEdit
            Left = 203
            Top = 307
            Width = 104
            Height = 23
            Enabled = False
            TabOrder = 22
          end
          object dbeSecEco: TEdit
            Left = 574
            Top = 306
            Width = 104
            Height = 23
            Enabled = False
            TabOrder = 26
          end
          object dbePais: TEdit
            Left = 58
            Top = 408
            Width = 107
            Height = 23
            Enabled = False
            TabOrder = 30
          end
          object dbeDeparta: TEdit
            Left = 228
            Top = 408
            Width = 110
            Height = 23
            Enabled = False
            TabOrder = 32
          end
          object dbeProvinc: TEdit
            Left = 401
            Top = 408
            Width = 107
            Height = 23
            Enabled = False
            TabOrder = 34
          end
          object dbeDistrito: TEdit
            Left = 567
            Top = 408
            Width = 109
            Height = 23
            Enabled = False
            TabOrder = 36
          end
          object dbeDNI: TwwDBEdit
            Left = 388
            Top = 27
            Width = 123
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVDNI'
            DataSource = DMLOG.dsProv
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeDNIExit
          end
          object dblcTipper: TwwDBLookupCombo
            Left = 515
            Top = 27
            Width = 40
            Height = 23
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPPERID'#9'2'#9'Id.'#9'F'
              'TIPPERDES'#9'30'#9'Descripci'#243'n'#9'F')
            DataField = 'TIPPERID'
            DataSource = DMLOG.dsProv
            LookupTable = DMLOG.cdsTipPer
            LookupField = 'TIPPERID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcTipperExit
            OnNotInList = dblcTipperNotInList
          end
          object dbetipper: TEdit
            Left = 557
            Top = 27
            Width = 123
            Height = 23
            Enabled = False
            TabOrder = 6
          end
          object dbenombres: TwwDBEdit
            Left = 6
            Top = 76
            Width = 268
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVNOMBRE'
            DataSource = DMLOG.dsProv
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbenombresExit
          end
          object dbeapepat: TwwDBEdit
            Left = 277
            Top = 76
            Width = 200
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVAPEPAT'
            DataSource = DMLOG.dsProv
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeapepatExit
          end
          object dbeapemat: TwwDBEdit
            Left = 480
            Top = 76
            Width = 200
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVAPEMAT'
            DataSource = DMLOG.dsProv
            TabOrder = 9
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeapematExit
          end
          object wwDBEdit1: TwwDBEdit
            Left = 555
            Top = 122
            Width = 123
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVEXONER'
            DataSource = DMLOG.dsProv
            TabOrder = 12
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object Z2bbtnPrint: TBitBtn
            Left = 538
            Top = 439
            Width = 30
            Height = 31
            Hint = 'Reporte'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 40
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
          object dbeNomCom: TwwDBEdit
            Left = 8
            Top = 165
            Width = 670
            Height = 23
            CharCase = ecUpperCase
            DataField = 'PROVNOMCOM'
            DataSource = DMLOG.dsProv
            TabOrder = 13
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeRazSocExit
          end
          object dblcProced: TwwDBLookupCombo
            Left = 12
            Top = 456
            Width = 45
            Height = 23
            DropDownAlignment = taLeftJustify
            DataField = 'PROV_PROC'
            DataSource = DMLOG.dsProv
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 41
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcProcedExit
          end
          object edtProced: TEdit
            Left = 64
            Top = 456
            Width = 121
            Height = 23
            Enabled = False
            TabOrder = 42
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Miembros'
        ImageIndex = 1
        TabVisible = False
        object Label32: TLabel
          Left = 9
          Top = 14
          Width = 138
          Height = 13
          Caption = 'Miembros de la Empresa'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbgMiembros: TwwDBGrid
          Left = 8
          Top = 35
          Width = 634
          Height = 318
          DisableThemesInTitle = False
          Selected.Strings = (
            'MIEMID'#9'2'#9'Miembro'
            'MIEMNOM'#9'40'#9'Nombre'
            'OCUPID'#9'3'#9'Ocupaci'#243'n'
            'MIEMSUELDO'#9'10'#9'Sueldo'
            'MIEMDDOMIC'#9'60'#9'Domicilio'
            'MIEMTELEF'#9'20'#9'Telefono'
            'MIEMNACIM'#9'10'#9'F.Nacimiento')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -11
          TitleFont.Name = 'Comic Sans MS'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgMiembrosDblClick
          object wwDBGrid2IButton: TwwIButton
            Left = 0
            Top = 0
            Width = 26
            Height = 28
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = wwDBGrid2IButtonClick
          end
        end
        object pnlMiembros: TPanel
          Left = 233
          Top = 113
          Width = 376
          Height = 200
          BevelInner = bvRaised
          BorderStyle = bsSingle
          TabOrder = 1
          Visible = False
          object Label31: TLabel
            Left = 15
            Top = 5
            Width = 152
            Height = 13
            Caption = 'Actualizaci'#243'n de Miembros'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label33: TLabel
            Left = 16
            Top = 23
            Width = 45
            Height = 15
            Caption = 'Miembro'
          end
          object Label34: TLabel
            Left = 70
            Top = 23
            Width = 40
            Height = 15
            Caption = 'Nombre'
          end
          object Label35: TLabel
            Left = 244
            Top = 65
            Width = 35
            Height = 15
            Caption = 'Sueldo'
          end
          object Label36: TLabel
            Left = 17
            Top = 64
            Width = 55
            Height = 15
            Caption = 'Ocupaci'#243'n'
          end
          object Label37: TLabel
            Left = 19
            Top = 109
            Width = 49
            Height = 15
            Caption = 'Domicilio'
          end
          object Label38: TLabel
            Left = 18
            Top = 153
            Width = 46
            Height = 15
            Caption = 'Telefono'
          end
          object Label39: TLabel
            Left = 168
            Top = 153
            Width = 59
            Height = 15
            Caption = 'Nacimiento'
          end
          object dbeMiembro: TwwDBEdit
            Left = 16
            Top = 40
            Width = 38
            Height = 23
            CharCase = ecUpperCase
            DataField = 'MIEMID'
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbeMiembroExit
          end
          object dbeNombre: TwwDBEdit
            Left = 68
            Top = 39
            Width = 281
            Height = 23
            CharCase = ecUpperCase
            DataField = 'MIEMNOM'
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcOcupac: TwwDBLookupCombo
            Left = 17
            Top = 80
            Width = 54
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'OCUPID'#9'3'#9'Id'#9'F'
              'OCUPDES'#9'30'#9'Ocupaci'#243'n'#9'F')
            DataField = 'OCUPID'
            LookupField = 'OCUPID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblcOcupacChange
            OnExit = dblcOcupacExit
          end
          object dbeOcupac: TwwDBEdit
            Left = 77
            Top = 79
            Width = 156
            Height = 23
            CharCase = ecUpperCase
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit11: TwwDBEdit
            Left = 243
            Top = 78
            Width = 106
            Height = 23
            CharCase = ecUpperCase
            DataField = 'MIEMSUELDO'
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit16: TwwDBEdit
            Left = 18
            Top = 125
            Width = 335
            Height = 23
            CharCase = ecUpperCase
            DataField = 'MIEMDDOMIC'
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit20: TwwDBEdit
            Left = 18
            Top = 167
            Width = 121
            Height = 23
            CharCase = ecUpperCase
            DataField = 'MIEMTELEF'
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object Z2bbtnCancel2: TBitBtn
            Left = 338
            Top = 162
            Width = 24
            Height = 26
            Hint = 'Reinicia Comprobante'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = Z2bbtnCancel2Click
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
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
          object Z2bbtnOK2: TBitBtn
            Left = 305
            Top = 162
            Width = 25
            Height = 26
            Hint = 'Pasa a Registrar Detalle'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = Z2bbtnOK2Click
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
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
          object wwDBDateTimePicker1: TwwDBDateTimePicker
            Left = 158
            Top = 167
            Width = 120
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 6
          end
        end
      end
      object tbshTipProv: TTabSheet
        Caption = 'Tipo de Proveedor'
        ImageIndex = 2
        object dbgTipProv: TwwDBGrid
          Left = 0
          Top = 0
          Width = 710
          Height = 297
          DisableThemesInTitle = False
          Selected.Strings = (
            'CLAUXID'#9'6'#9'Clase~Auxiliar'
            'CLAUXDES'#9'17'#9'Descripci'#243'n~Clase'
            'PROV'#9'9'#9'ID~Proveedor'
            'PROVDES'#9'23'#9'Desciprici'#243'n~Proveedor'
            'TIPPROVID'#9'5'#9'ID Tipo~Proveedor'
            'TIPPROVDES'#9'23'#9'Descripci'#243'n~Tipo Proveedor')
          IniAttributes.Delimiter = ';;'
          TitleColor = 7566265
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = DMLOG.dsMTipProv
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          KeyOptions = []
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'Comic Sans MS'
          TitleFont.Style = []
          TitleLines = 3
          TitleButtons = False
          OnDblClick = dbgTipProvDblClick
          OnKeyDown = dbgTipProvKeyDown
          object wwDBGrid1IButton: TwwIButton
            Left = 0
            Top = 0
            Width = 30
            Height = 36
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = wwDBGrid1IButtonClick
          end
        end
        object pnlTipProv: TPanel
          Left = 195
          Top = 304
          Width = 313
          Height = 158
          BevelInner = bvLowered
          BevelWidth = 2
          BorderStyle = bsSingle
          Color = 14869218
          TabOrder = 1
          Visible = False
          object DBText1: TDBText
            Left = 120
            Top = 12
            Width = 89
            Height = 17
            DataField = 'CLAUXID'
            DataSource = DMLOG.dsProv
          end
          object DBText2: TDBText
            Left = 120
            Top = 42
            Width = 161
            Height = 17
            DataField = 'PROV'
            DataSource = DMLOG.dsProv
          end
          object lblTipprov: TLabel
            Left = 165
            Top = 72
            Width = 125
            Height = 15
            AutoSize = False
            Caption = 'Tipo'
          end
          object Label2: TLabel
            Left = 25
            Top = 12
            Width = 73
            Height = 15
            Caption = 'Clase Auxiliar'
          end
          object Label6: TLabel
            Left = 25
            Top = 42
            Width = 64
            Height = 15
            Caption = 'C'#243'digo Prov.'
          end
          object Label15: TLabel
            Left = 25
            Top = 72
            Width = 78
            Height = 15
            Caption = 'Tipo Proveedor'
          end
          object Panel5: TPanel
            Left = 4
            Top = 109
            Width = 301
            Height = 41
            Align = alBottom
            Color = 14869218
            TabOrder = 0
            object Z2bbtnOKTP: TBitBtn
              Left = 187
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Pasa a Registrar Detalle'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = Z2bbtnOKTPClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
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
            object Z2bbtnCancelTP: TBitBtn
              Left = 226
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Reinicia Comprobante'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = Z2bbtnCancelTPClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
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
            object Z2bbtnNuevoTP: TBitBtn
              Left = 263
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Nuevo Registro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -19
              Font.Name = 'Garamond'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Visible = False
              OnClick = Z2bbtnNuevoClick
              Glyph.Data = {
                96010000424D9601000000000000760000002800000017000000180000000100
                04000000000020010000CE0E0000D80E00001000000000000000000000000000
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
          object dblcTipProv: TwwDBLookupCombo
            Left = 120
            Top = 72
            Width = 39
            Height = 23
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPPROVID'#9'2'#9'ID'#9'F'
              'TIPPROVDES'#9'30'#9'Descripci'#243'n'#9'F')
            DataField = 'TIPPROVID'
            DataSource = DMLOG.dsMTipProv
            LookupTable = DMLOG.cdsTipProv
            LookupField = 'TIPPROVID'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 15
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcTipProvExit
          end
        end
      end
      object tbshLinea: TTabSheet
        Caption = 'L'#237'nea'
        ImageIndex = 3
        object dbgProvLinea: TwwDBGrid
          Left = 0
          Top = 0
          Width = 710
          Height = 297
          DisableThemesInTitle = False
          Selected.Strings = (
            'CLAUXID'#9'6'#9'Clase~Auxiliar'
            'CLAUXDES'#9'17'#9'Descripci'#243'n~Clase'
            'PROV'#9'9'#9'ID~Proveedor'
            'PROVDES'#9'23'#9'Desciprici'#243'n~Proveedor'
            'GRARID'#9'6'#9'ID Linea'
            'GRARDES'#9'20'#9'Descripci'#243'n~Linea')
          IniAttributes.Delimiter = ';;'
          TitleColor = 7566265
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = DMLOG.dsMTipProv
          KeyOptions = []
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -11
          TitleFont.Name = 'Comic Sans MS'
          TitleFont.Style = []
          TitleLines = 3
          TitleButtons = False
          OnDblClick = dbgProvLineaDblClick
          OnKeyDown = dbgProvLineaKeyDown
          object dbgBbtnLinea: TwwIButton
            Left = 0
            Top = 0
            Width = 30
            Height = 36
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = dbgBbtnLineaClick
          end
        end
        object pnlProvLinea: TPanel
          Left = 195
          Top = 304
          Width = 313
          Height = 158
          BevelInner = bvLowered
          BevelWidth = 2
          BorderStyle = bsSingle
          Color = 14869218
          TabOrder = 1
          Visible = False
          object DBText3: TDBText
            Left = 120
            Top = 12
            Width = 145
            Height = 17
            DataField = 'CLAUXID'
            DataSource = DMLOG.dsProv
          end
          object DBText4: TDBText
            Left = 120
            Top = 36
            Width = 161
            Height = 17
            DataField = 'PROV'
            DataSource = DMLOG.dsProv
          end
          object Label42: TLabel
            Left = 25
            Top = 12
            Width = 73
            Height = 15
            Caption = 'Clase Auxiliar'
          end
          object Label43: TLabel
            Left = 25
            Top = 36
            Width = 64
            Height = 15
            Caption = 'C'#243'digo Prov.'
          end
          object lblGrArtID: TLabel
            Left = 25
            Top = 64
            Width = 91
            Height = 15
            Caption = 'L'#237'nea de Producto'
          end
          object lblLineaDesc: TLabel
            Left = 177
            Top = 64
            Width = 3
            Height = 15
          end
          object Panel6: TPanel
            Left = 4
            Top = 109
            Width = 301
            Height = 41
            Align = alBottom
            Color = 14869218
            TabOrder = 0
            object BitBtn1: TBitBtn
              Left = 187
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Pasa a Registrar Detalle'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BitBtn1Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
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
            object BitBtn2: TBitBtn
              Left = 226
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Reinicia Comprobante'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BitBtn2Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
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
            object BitBtn3: TBitBtn
              Left = 263
              Top = 7
              Width = 32
              Height = 31
              Hint = 'Nuevo Registro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -19
              Font.Name = 'Garamond'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Visible = False
              Glyph.Data = {
                96010000424D9601000000000000760000002800000017000000180000000100
                04000000000020010000CE0E0000D80E00001000000000000000000000000000
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
          object dblcGrpArti: TwwDBLookupCombo
            Left = 123
            Top = 57
            Width = 49
            Height = 23
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TINID'#9'2'#9'T.Inv'#9'F'
              'GRARID'#9'3'#9'Grupos'#9'F'
              'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
            LookupTable = DMLOG.cdsGArti
            LookupField = 'GRARID'
            Options = [loColLines, loTitles]
            DropDownCount = 15
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcGrpArtiExit
          end
        end
      end
    end
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = ppdbReporte
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Log\Sacsa\RepTipProv.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReportePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 584
    Top = 397
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbReporte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Clasificaci'#243'n de Proveedores por Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 55563
        mmTop = 3175
        mmWidth = 94192
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 6879
        mmTop = 21431
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 55827
        mmTop = 21431
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'R.U.C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 30956
        mmTop = 21431
        mmWidth = 10319
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 26458
        mmWidth = 202671
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 180182
        mmTop = 1323
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 1323
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 180182
        mmTop = 7673
        mmWidth = 19844
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 180182
        mmTop = 13494
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 7673
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 13494
        mmWidth = 10319
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROV'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PROVDES'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4233
        mmLeft = 54769
        mmTop = 0
        mmWidth = 80169
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PROVRUC'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4233
        mmLeft = 30956
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText2'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'TIPPROVID'
          DataPipeline = ppdbReporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 0
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'TIPPROVDES'
          DataPipeline = ppdbReporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 4233
          mmLeft = 19844
          mmTop = 0
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'PROV'
          DataPipeline = ppdbReporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppdbReporte'
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Total por Tipo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 529
          mmWidth = 202671
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbReporte: TppDBPipeline
    DataSource = DMLOG.dsReporte
    UserName = 'dbReporte'
    Left = 664
    Top = 413
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'TLISTAID'
      FieldName = 'TLISTAID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'ARTID'
      FieldName = 'ARTID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCONT'
      FieldName = 'ARTCONT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'FAMID'
      FieldName = 'FAMID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'SFAMID'
      FieldName = 'SFAMID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 3
      DisplayWidth = 3
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'UNMABR'
      FieldName = 'UNMABR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'LPRETMONID'
      FieldName = 'LPRETMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPRETCAM'
      FieldName = 'LPRETCAM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'LPREFINI'
      FieldName = 'LPREFINI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREVIG'
      FieldName = 'LPREVIG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASGMO'
      FieldName = 'LPREBASGMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASGMN'
      FieldName = 'LPREBASGMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASGME'
      FieldName = 'LPREBASGME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASUMO'
      FieldName = 'LPREBASUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASUMN'
      FieldName = 'LPREBASUMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREBASUME'
      FieldName = 'LPREBASUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPINCG'
      FieldName = 'LPREPINCG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPINCU'
      FieldName = 'LPREPINCU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREVOLMG'
      FieldName = 'LPREVOLMG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREVOLMU'
      FieldName = 'LPREVOLMU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPDCTOG'
      FieldName = 'LPREPDCTOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPDCTOU'
      FieldName = 'LPREPDCTOU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREGMO'
      FieldName = 'LPREPREGMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREGMN'
      FieldName = 'LPREPREGMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREGME'
      FieldName = 'LPREPREGME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREUMO'
      FieldName = 'LPREPREUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREUMN'
      FieldName = 'LPREPREUMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREPREUME'
      FieldName = 'LPREPREUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO2G'
      FieldName = 'LPREDCTO2G'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO3G'
      FieldName = 'LPREDCTO3G'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO4G'
      FieldName = 'LPREDCTO4G'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO2U'
      FieldName = 'LPREDCTO2U'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO3U'
      FieldName = 'LPREDCTO3U'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'LPREDCTO4U'
      FieldName = 'LPREDCTO4U'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTMING'
      FieldName = 'CANTMING'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTMINU'
      FieldName = 'CANTMINU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'LPREIGV'
      FieldName = 'LPREIGV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'LPREISC'
      FieldName = 'LPREISC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'LPREFLAGD'
      FieldName = 'LPREFLAGD'
      FieldLength = 1
      DisplayWidth = 1
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'LPREFREG'
      FieldName = 'LPREFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      FieldAlias = 'LPREHREG'
      FieldName = 'LPREHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'LPREUSER'
      FieldName = 'LPREUSER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'ARTDES'
      FieldName = 'ARTDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 50
    end
  end
end
