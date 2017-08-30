object fmManutencaoProduto: TfmManutencaoProduto
  Left = 294
  Top = 169
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o do Produto'
  ClientHeight = 273
  ClientWidth = 425
  Color = 16048082
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancelar: TSpeedButton
    Left = 110
    Top = 5
    Width = 86
    Height = 41
    Caption = 'C&ancelar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    OnClick = btnCancelarClick
  end
  object btnConfirmar: TSpeedButton
    Left = 10
    Top = 5
    Width = 86
    Height = 41
    Caption = '&Confirmar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    OnClick = btnConfirmarClick
  end
  object pnlDados: TPanel
    Left = 10
    Top = 55
    Width = 401
    Height = 206
    BevelInner = bvLowered
    Color = 16048082
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 10
      Top = 55
      Width = 90
      Height = 13
      Caption = 'C'#243'digo de Estoque'
    end
    object Label3: TLabel
      Left = 140
      Top = 55
      Width = 82
      Height = 13
      Caption = 'C'#243'digo de Venda'
    end
    object Label4: TLabel
      Left = 10
      Top = 100
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label5: TLabel
      Left = 10
      Top = 145
      Width = 114
      Height = 13
      Caption = 'Quantidade em Estoque'
    end
    object Label6: TLabel
      Left = 140
      Top = 145
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object edtID: TEdit
      Left = 10
      Top = 25
      Width = 61
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
    end
    object edtCodigoEstoque: TEdit
      Left = 10
      Top = 70
      Width = 116
      Height = 21
      MaxLength = 16
      TabOrder = 1
    end
    object edtCodigoVenda: TEdit
      Left = 140
      Top = 70
      Width = 116
      Height = 21
      MaxLength = 16
      TabOrder = 2
    end
    object edtDescricao: TEdit
      Left = 10
      Top = 115
      Width = 376
      Height = 21
      MaxLength = 80
      TabOrder = 3
    end
    object edtQuantidadeEmEstoque: TEdit
      Left = 10
      Top = 160
      Width = 116
      Height = 21
      Color = clBtnFace
      Enabled = False
      MaxLength = 16
      TabOrder = 4
    end
    object edtValor: TEdit
      Left = 140
      Top = 160
      Width = 116
      Height = 21
      MaxLength = 16
      TabOrder = 5
    end
  end
end
