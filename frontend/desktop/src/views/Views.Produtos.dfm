inherited FrmProdutos: TFrmProdutos
  Caption = 'FrmProdutos'
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitle: TLabel
      Width = 80
      Caption = 'Produtos'
      ExplicitWidth = 80
    end
  end
  inherited CardPanel: TCardPanel
    ActiveCard = CardCadastro
    inherited CardVisualizar: TCard
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
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
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
            FieldName = 'ESTOQUE'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
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
      inherited pnlCadastro: TPanel
        object lblCodigo: TLabel
          Left = 14
          Top = 18
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblNome: TLabel
          Left = 97
          Top = 18
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object lblValor: TLabel
          Left = 14
          Top = 82
          Width = 26
          Height = 15
          Caption = 'Valor'
        end
        object lblEstoque: TLabel
          Left = 133
          Top = 82
          Width = 42
          Height = 15
          Caption = 'Estoque'
        end
        object edtCodigo: TDBEdit
          Left = 14
          Top = 39
          Width = 68
          Height = 23
          DataField = 'ID'
          DataSource = dsCadastro
          Enabled = False
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 97
          Top = 39
          Width = 538
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NOME'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object ckbStatus: TDBCheckBox
          Left = 657
          Top = 42
          Width = 60
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Ativo?'
          DataField = 'STATUS'
          DataSource = dsCadastro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object edtValor: TDBEdit
          Left = 14
          Top = 103
          Width = 100
          Height = 23
          DataField = 'VALOR'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object edtEstoque: TDBEdit
          Left = 133
          Top = 103
          Width = 100
          Height = 23
          DataField = 'ESTOQUE'
          DataSource = dsCadastro
          TabOrder = 4
        end
      end
    end
  end
end
