object FToolReqAut: TFToolReqAut
  Left = 300
  Top = 112
  Width = 692
  Height = 65
  Caption = 'FToolReqAut'
  Color = 10207162
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 31
    Align = alClient
    BevelOuter = bvNone
    Color = 10207162
    TabOrder = 0
    object bbtnOCxProf: TBitBtn
      Left = 4
      Top = 4
      Width = 150
      Height = 25
      Caption = 'Generar Requisici'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object bbtnOCxArt: TBitBtn
      Left = 155
      Top = 4
      Width = 144
      Height = 25
      Caption = 'Por &Art./Serv./Act. Fijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object bbtnOCxRqs: TBitBtn
      Left = 300
      Top = 4
      Width = 129
      Height = 25
      Caption = 'Por &Requisici'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
end
