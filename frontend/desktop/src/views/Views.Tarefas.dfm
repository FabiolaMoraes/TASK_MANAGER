inherited FrmTarefas: TFrmTarefas
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlHeader: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblTitle: TLabel
      Width = 59
      Caption = 'Tarefas'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 59
    end
  end
  inherited CardPanel: TCardPanel
    ActiveCard = CardVisualizar
    StyleElements = [seFont, seClient, seBorder]
    inherited CardVisualizar: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlBotoes: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnlFooter: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited btnProximo: TSpeedButton
          ExplicitLeft = 143
          ExplicitTop = 0
        end
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
            FieldName = 'TITULO'
            Title.Caption = 'T'#237'tulo'
            Width = 295
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 194
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIORIDADE'
            Title.Caption = 'Prioridade'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 108
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
        object lblPesquisaTitulo: TLabel
          Left = 76
          Top = 10
          Width = 30
          Height = 15
          Caption = 'T'#237'tulo'
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
        object edtPesquisaTitulo: TEdit
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
        object lblCodigo: TLabel
          Left = 10
          Top = 10
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblNome: TLabel
          Left = 84
          Top = 10
          Width = 30
          Height = 15
          Caption = 'T'#237'tulo'
        end
        object Label1: TLabel
          Left = 10
          Top = 60
          Width = 51
          Height = 15
          Caption = 'Descri'#231#227'o'
        end
        object lblStatus: TLabel
          Left = 162
          Top = 110
          Width = 32
          Height = 15
          Caption = 'Status'
        end
        object lblPrioridade: TLabel
          Left = 10
          Top = 110
          Width = 54
          Height = 15
          Caption = 'Prioridade'
        end
        object edtCodigo: TDBEdit
          Left = 10
          Top = 31
          Width = 68
          Height = 23
          DataField = 'ID'
          DataSource = dsCadastro
          Enabled = False
          TabOrder = 0
        end
        object edtTitulo: TDBEdit
          Left = 84
          Top = 31
          Width = 701
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'TITULO'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object cbxStatus: TDBComboBox
          Left = 162
          Top = 131
          Width = 146
          Height = 23
          DataField = 'STATUS'
          DataSource = dsCadastro
          Items.Strings = (
            'PENDENTE'
            'EM PROGRESSO'
            'CONCLUIDA'
            'CANCELADA')
          TabOrder = 2
        end
        object cbxPrioridade: TDBComboBox
          Left = 10
          Top = 131
          Width = 146
          Height = 23
          DataField = 'PRIORIDADE'
          DataSource = dsCadastro
          Items.Strings = (
            'BAIXA'
            'MEDIA'
            'ALTA')
          TabOrder = 3
        end
        object edtDescricao: TDBEdit
          Left = 10
          Top = 81
          Width = 775
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESCRICAO'
          DataSource = dsCadastro
          TabOrder = 4
          TextHint = '  '
        end
      end
      inherited pnlFooterCadastro: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited btnConfirmar: TSpeedButton
          ExplicitLeft = 578
          ExplicitTop = 6
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 336
  end
  inherited dsCadastro: TDataSource
    Left = 416
  end
end
