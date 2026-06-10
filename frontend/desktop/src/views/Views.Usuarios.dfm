inherited FrmUsuarios: TFrmUsuarios
  Caption = 'FrmUsuarios'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlHeader: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblTitle: TLabel
      Width = 75
      Caption = 'Usu'#225'rios'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 75
    end
  end
  inherited CardPanel: TCardPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited CardVisualizar: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlBotoes: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnlFooter: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited lblPagina: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited pnlRegistros: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited lblRegistros: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited cmbRegistros: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inherited DBGrid: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 390
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGIN'
            Title.Alignment = taCenter
            Title.Caption = 'Login'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Title.Alignment = taCenter
            Title.Caption = 'Telefone'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        StyleElements = [seFont, seClient, seBorder]
        object lblPesquisaCodigo: TLabel
          Left = 10
          Top = 10
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblPesquisaNome: TLabel
          Left = 76
          Top = 10
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object edtPesquisaCodigo: TEdit
          Left = 10
          Top = 31
          Width = 60
          Height = 23
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 0
        end
        object edtPesquisaNome: TEdit
          Left = 76
          Top = 31
          Width = 700
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    inherited CardCadastro: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlCadastro: TPanel
        StyleElements = [seFont, seClient, seBorder]
        DesignSize = (
          798
          527)
        object lblCodigo: TLabel
          Left = 14
          Top = 10
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblNome: TLabel
          Left = 88
          Top = 10
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object lblLogin: TLabel
          Left = 14
          Top = 60
          Width = 30
          Height = 15
          Caption = 'Login'
        end
        object lblSenha: TLabel
          Left = 220
          Top = 60
          Width = 32
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Senha'
        end
        object lblTelefone: TLabel
          Left = 426
          Top = 60
          Width = 44
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Telefone'
        end
        object edtNome: TDBEdit
          Left = 88
          Top = 31
          Width = 538
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NOME'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object ckbStatus: TDBCheckBox
          Left = 632
          Top = 34
          Width = 60
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Ativo?'
          DataField = 'STATUS'
          DataSource = dsCadastro
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object edtLogin: TDBEdit
          Left = 14
          Top = 81
          Width = 200
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'LOGIN'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object edtSenha: TDBEdit
          Left = 220
          Top = 81
          Width = 200
          Height = 23
          Anchors = [akTop, akRight]
          DataField = 'SENHA'
          DataSource = dsCadastro
          PasswordChar = '*'
          TabOrder = 3
        end
        object edtTelefone: TDBEdit
          Left = 426
          Top = 81
          Width = 150
          Height = 23
          Anchors = [akTop, akRight]
          DataField = 'TELEFONE'
          DataSource = dsCadastro
          TabOrder = 4
        end
        object edtCodigo: TDBEdit
          Left = 14
          Top = 31
          Width = 68
          Height = 23
          DataField = 'ID'
          DataSource = dsCadastro
          Enabled = False
          TabOrder = 5
        end
      end
      inherited pnlFooterCadastro: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 336
  end
end
