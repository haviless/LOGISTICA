object FToolDetMov: TFToolDetMov
  Left = 288
  Top = 323
  Width = 637
  Height = 105
  Caption = 'Detalle de Movimiento'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 71
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object gbPeriodo: TGroupBox
      Left = 5
      Top = 3
      Width = 276
      Height = 60
      Caption = 'Periodo'
      TabOrder = 0
      object Label3: TLabel
        Left = 13
        Top = 12
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 124
        Top = 12
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object dtpDesde: TDateTimePicker
        Left = 13
        Top = 27
        Width = 99
        Height = 23
        Date = 36892.719144328700000000
        Time = 36892.719144328700000000
        TabOrder = 0
      end
      object dtpHasta: TDateTimePicker
        Left = 124
        Top = 27
        Width = 97
        Height = 23
        Date = 36943.719144328700000000
        Time = 36943.719144328700000000
        TabOrder = 1
      end
      object Z1sbPeriodo: TBitBtn
        Left = 237
        Top = 32
        Width = 36
        Height = 25
        TabOrder = 2
        OnClick = Z1sbPeriodoClick
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
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 328
    Top = 32
  end
end
