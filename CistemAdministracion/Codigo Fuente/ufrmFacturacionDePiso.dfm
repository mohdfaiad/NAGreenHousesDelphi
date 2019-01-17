inherited FrmFacturacionDePiso: TFrmFacturacionDePiso
  Left = 320
  Align = alClient
  Caption = 'FrmFacturacionDePiso'
  ClientHeight = 572
  ClientWidth = 799
  Position = poDesigned
  ExplicitWidth = 799
  ExplicitHeight = 572
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFacturacion: TcxPageControl
    Left = 0
    Top = 0
    Width = 799
    Height = 572
    Hint = ''
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabCupones
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmImages.Imagenes
    Properties.TabPosition = tpBottom
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 542
    ClientRectLeft = 3
    ClientRectRight = 793
    ClientRectTop = 3
    object cxTabFacturacion: TcxTabSheet
      Caption = 'Facturaci'#243'n '
      ImageIndex = 37
      object GrBoxDatos: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        TabStop = True
        Align = alTop
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 171
        Width = 790
        object LblFolio: TcxLabel
          Left = 204
          Top = 8
          Hint = ''
          Caption = 'Folio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblNoCliente: TcxLabel
          Left = 8
          Top = 47
          Hint = ''
          Caption = 'Cliente'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblRFC: TcxLabel
          Left = 450
          Top = 47
          Hint = ''
          Caption = 'RFC'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblFecha: TcxLabel
          Left = 10
          Top = 8
          Hint = ''
          Caption = 'Fecha'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblDireccion: TcxLabel
          Left = 8
          Top = 87
          Hint = ''
          Caption = 'Direcci'#243'n'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblColnia: TcxLabel
          Left = 450
          Top = 87
          Hint = ''
          Caption = 'Colonia'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblCiudad: TcxLabel
          Left = 8
          Top = 124
          Hint = ''
          Caption = 'Ciudad'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblCodigoPostal: TcxLabel
          Left = 312
          Top = 124
          Hint = ''
          Caption = 'Codigo Postal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel1: TcxLabel
          Left = 93
          Top = 47
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDbTxtFolio: TcxDBTextEdit
          Left = 204
          Top = 24
          Hint = ''
          DataBinding.DataField = 'Folio'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 1
          Width = 117
        end
        object cxDBTxtCliente: TcxDBTextEdit
          Left = 10
          Top = 20
          Hint = ''
          DataBinding.DataField = 'ClienteID'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          OnExit = cxDBTxtClienteExit
          Width = 77
        end
        object cxDBTxtNombre: TcxDBTextEdit
          Left = 93
          Top = 64
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 14
          Width = 351
        end
        object cxDBTxtRFC: TcxDBTextEdit
          Left = 450
          Top = 64
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 15
          Width = 161
        end
        object cxDBTxtDireccion: TcxDBTextEdit
          Left = 10
          Top = 102
          Hint = ''
          DataBinding.DataField = 'Calle'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 16
          Width = 434
        end
        object cxDBTxtColonia: TcxDBTextEdit
          Left = 450
          Top = 102
          Hint = ''
          DataBinding.DataField = 'Colonia'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 17
          Width = 161
        end
        object cxDBTxtCiudad: TcxDBTextEdit
          Left = 10
          Top = 140
          Hint = ''
          DataBinding.DataField = 'Ciudad'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 18
          Width = 296
        end
        object cxDBTxtCP: TcxDBTextEdit
          Left = 312
          Top = 140
          Hint = ''
          DataBinding.DataField = 'CodigoPostal'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 19
          Width = 132
        end
        object cxDBDateFecha: TcxDBDateEdit
          Left = 10
          Top = 24
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Fecha'
          DataBinding.DataSource = dsFactura
          Enabled = False
          TabOrder = 20
          Width = 132
        end
        object cxDBTxtSerie: TcxDBTextEdit
          Left = 150
          Top = 24
          Hint = ''
          DataBinding.DataField = 'Serie'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 47
        end
        object cxLabel3: TcxLabel
          Left = 150
          Top = 8
          Hint = ''
          Caption = 'Serie'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cbxFormaPago: TcxDBLookupComboBox
          Left = 450
          Top = 24
          Hint = ''
          DataBinding.DataField = 'FormaPagoID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'FormaPagoID'
          Properties.ListColumns = <
            item
              FieldName = 'FormaPagoID'
            end
            item
              Caption = 'Descripci'#243'n'
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsFormaPago
          TabOrder = 3
          Width = 161
        end
        object cxLabel2: TcxLabel
          Left = 450
          Top = 8
          Hint = ''
          Caption = 'Forma de Pago'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cbxTipoFactura: TcxDBLookupComboBox
          Left = 327
          Top = 24
          Hint = ''
          DataBinding.DataField = 'TipoFacturaID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'TipoFacturaID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsTipoFactura
          TabOrder = 2
          Width = 117
        end
        object cxLabel4: TcxLabel
          Left = 325
          Top = 8
          Hint = ''
          Caption = 'Tipo Factura'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 467
        Hint = ''
        Align = alBottom
        TabOrder = 1
        Height = 72
        Width = 790
        object LblFacturacionIva: TcxLabel
          Left = 439
          Top = 32
          Hint = ''
          Caption = 'IVA'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblFacturacionTotal: TcxLabel
          Left = 439
          Top = 55
          Hint = ''
          Caption = 'Total'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object txtTotalFactura: TcxDBTextEdit
          Left = 495
          Top = 51
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Total'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 121
        end
        object txtImpuestoFactura: TcxDBTextEdit
          Left = 495
          Top = 29
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 121
        end
        object txtSubTotalFactura: TcxDBTextEdit
          Left = 495
          Top = 7
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Subtotal'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 121
        end
        object LblFacturacionSubtotal: TcxLabel
          Left = 439
          Top = 11
          Hint = ''
          Caption = 'Subtotal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 171
        Hint = ''
        Align = alClient
        TabOrder = 2
        Height = 296
        Width = 790
        object GridFacturacion: TcxGrid
          Left = 2
          Top = 5
          Width = 786
          Height = 289
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = True
          object GridFacturacionDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleFactura
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            object GridFacturacionDBTableView1ProductoID: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
            end
            object GridFacturacionDBTableView1Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'Descripcion'
              Width = 342
            end
            object GridFacturacionDBTableView1Cantidad: TcxGridDBColumn
              DataBinding.FieldName = 'Cantidad'
            end
            object GridFacturacionDBTableView1PrecioCalculado: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PrecioCalculado'
              Options.Editing = False
              Options.Focusing = False
            end
            object GridFacturacionDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Editing = False
              Options.Focusing = False
              Width = 77
            end
          end
          object GridFacturacionLevel1: TcxGridLevel
            GridView = GridFacturacionDBTableView1
          end
        end
      end
    end
    object cxTabTicket: TcxTabSheet
      Caption = 'Tickets '
      ImageIndex = 21
      object cxGroupBox3: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        Align = alClient
        TabOrder = 0
        Height = 539
        Width = 790
        object grdTicket: TcxGrid
          Left = 2
          Top = 5
          Width = 786
          Height = 532
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = True
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsTicketFactura
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
                Column = cxGridDBTableView1Volumen
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '##,###,##0.#0'
                Kind = skSum
                Column = cxGridDBTableView1Volumen
              end
              item
                Kind = skSum
                Column = cxGridDBTableView1Importe
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
            object cxGridDBTableView1TicketID: TcxGridDBColumn
              DataBinding.FieldName = 'TicketID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView1TicketIDPropertiesValidate
            end
            object cxGridDBTableView1Fecha: TcxGridDBColumn
              DataBinding.FieldName = 'Fecha'
            end
            object cxGridDBTableView1Producto: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
              Width = 62
            end
            object cxGridDBTableView1Nombre: TcxGridDBColumn
              DataBinding.FieldName = 'Nombre'
              Width = 167
            end
            object cxGridDBTableView1Volumen: TcxGridDBColumn
              DataBinding.FieldName = 'Volumen'
            end
            object cxGridDBTableView1Precio: TcxGridDBColumn
              DataBinding.FieldName = 'Precio'
            end
            object cxGridDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object cbxListaTicket: TcxComboBox
          Left = 504
          Top = 348
          Hint = ''
          TabStop = False
          TabOrder = 1
          Text = 'cbxListaTicket'
          Visible = False
          Width = 121
        end
        object cxGrid4: TcxGrid
          Left = 152
          Top = 128
          Width = 250
          Height = 200
          Hint = ''
          TabOrder = 2
          object cxGrid4DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = cxGrid4DBTableView1
          end
        end
      end
    end
    object cxTabCupones: TcxTabSheet
      Caption = 'Cupones  '
      ImageIndex = 23
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrdCupon: TcxGrid
        Left = 0
        Top = 0
        Width = 790
        Height = 539
        Hint = ''
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsCupones
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          object cxGridDBTableView2Importe: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
          end
          object cxGridDBTableView2Referencia: TcxGridDBColumn
            DataBinding.FieldName = 'Referencia'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
  end
  object cxPagFacturacion: TcxPageControl
    Left = 0
    Top = 0
    Width = 799
    Height = 572
    Hint = ''
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmImages.Imagenes
    Properties.TabPosition = tpBottom
    LookAndFeel.NativeStyle = False
    OnPageChanging = cxPagFacturacionPageChanging
    ClientRectBottom = 542
    ClientRectLeft = 3
    ClientRectRight = 793
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Facturaci'#243'n '
      ImageIndex = 37
      object grbEncabezado: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        TabStop = True
        Align = alTop
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 177
        Width = 790
        object cxLabel5: TcxLabel
          Left = 216
          Top = 18
          Hint = ''
          Caption = 'Folio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 8
          Top = 58
          Hint = ''
          Caption = 'Cliente'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel7: TcxLabel
          Left = 448
          Top = 58
          Hint = ''
          Caption = 'RFC'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 18
          Hint = ''
          Caption = 'Fecha'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel9: TcxLabel
          Left = 8
          Top = 98
          Hint = ''
          Caption = 'Direcci'#243'n'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel10: TcxLabel
          Left = 448
          Top = 98
          Hint = ''
          Caption = 'Colonia'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 8
          Top = 138
          Hint = ''
          Caption = 'Ciudad'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel12: TcxLabel
          Left = 312
          Top = 138
          Hint = ''
          Caption = 'Codigo Postal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 112
          Top = 58
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 112
          Top = 74
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCliente
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 14
          Width = 329
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 448
          Top = 74
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 15
          Width = 161
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 8
          Top = 114
          Hint = ''
          DataBinding.DataField = 'Calle'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 16
          Width = 434
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 448
          Top = 114
          Hint = ''
          DataBinding.DataField = 'Colonia'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 17
          Width = 161
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 8
          Top = 154
          Hint = ''
          DataBinding.DataField = 'Ciudad'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 18
          Width = 296
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 312
          Top = 154
          Hint = ''
          DataBinding.DataField = 'CodigoPostal'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 19
          Width = 129
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 8
          Top = 34
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Fecha'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 20
          Width = 132
        end
        object cxLabel14: TcxLabel
          Left = 152
          Top = 18
          Hint = ''
          Caption = 'Serie'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel15: TcxLabel
          Left = 448
          Top = 18
          Hint = ''
          Caption = 'Forma de Pago'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel16: TcxLabel
          Left = 448
          Top = 138
          Hint = ''
          Caption = 'Tipo Factura'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object dbTxtSerie: TcxDBTextEdit
          Left = 152
          Top = 34
          Hint = ''
          DataBinding.DataField = 'Serie'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 0
          OnExit = dbTxtSerieExit
          Width = 47
        end
        object dbTxtFolio: TcxDBTextEdit
          Left = 216
          Top = 34
          Hint = ''
          DataBinding.DataField = 'Folio'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 1
          OnEnter = dbTxtFolioEnter
          Width = 117
        end
        object cxDbTipoFactura: TcxDBLookupComboBox
          Left = 448
          Top = 154
          Hint = ''
          DataBinding.DataField = 'TipoFacturaID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'TipoFacturaID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsTipoFactura
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          Width = 117
        end
        object dbCbxFormaPago: TcxDBLookupComboBox
          Left = 448
          Top = 34
          Hint = ''
          DataBinding.DataField = 'FormaPagoID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'FormaPagoID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsFormaPago
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 3
          OnEnter = dbCbxFormaPagoEnter
          Width = 161
        end
        object dbTxtCliente: TcxDBTextEdit
          Left = 8
          Top = 74
          Hint = ''
          DataBinding.DataField = 'ClienteID'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 4
          OnEnter = dbTxtClienteEnter
          OnExit = cxDBTxtClienteExit
          OnKeyDown = dbTxtClienteKeyDown
          Width = 73
        end
        object cxButton1: TcxButton
          Left = 80
          Top = 71
          Width = 25
          Height = 25
          OptionsImage.Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000120B0000120B0000000100000000000000000000FFFF
            FF0089819900FF00FF001F1E1F0062555D00745D65008C6D73005D484A007D52
            5400865151008E5757008652520087535300B6757500B4767600B8797900B275
            7500B074740087595900CA8B8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1
            A100E1A1A100E6A6A600845250009A6B6A00DD908C00E9A4A100814844009E5C
            5600895753005D3D3600FF5D3500F39681005A3C35005D3E3600D7C2BC008936
            1C00F0C5B800CB532A0086391F00572D1F00D0A09000C0582D00DDCFC9007242
            2700DCCFC700BD4C0000BC4B0000B84A0000B64A0000A3420100883A0300A746
            05006C300400FFF8F200B4916D00FECB9600E1B58600C59F7600A18363007F68
            4F00846C530093A5A500EEEFEF001C41450007BCED000C98BD00068FC1002180
            A300F0F6F8002D84A7000D222B000196DE00036292000D466300165E82001F23
            2500C9E0EB00008EDE0006365100157BB6005896B800145C8C00D8E6EF00004B
            820084C1ED00319FFC0035A3FF0084BCEA00B0D7F6000263BF001F87E9007E91
            A700161A1F003E4145001031D3000320BA000318B200000F95002F45ED000C19
            B400010B9900010A95002732D000000081000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000003030304514C
            03030303030303030303030303034F4E54620303030303030303333434364550
            06092D3A3837353434033301013B43051E100B2342403E3D340333012F292C08
            1F16110D26413F3D340333012B2401251C19150F0C273C3D340333012A025561
            2E131A17120A313D340333015D5560555E32221B140E206334033301575B5C55
            5A01391D1807494747033301595B5B5952013430214B4653676D330158595956
            4A01340128484D65666A33010101010101013401013B5F68646B330101010101
            010134010101446C690334333333333333333333333333333303033434343434
            3434343434343434030303030303030303030303030303030303}
          TabOrder = 24
          OnClick = cxButton1Click
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 446
        Hint = ''
        Align = alBottom
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 1
        Height = 93
        Width = 790
        object cxLabel17: TcxLabel
          Left = 431
          Top = 47
          Hint = ''
          Caption = 'IVA'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel18: TcxLabel
          Left = 431
          Top = 69
          Hint = ''
          Caption = 'Total'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 487
          Top = 67
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Total'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit10PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Visible = False
          Width = 121
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 487
          Top = 45
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit11PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Visible = False
          Width = 121
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 487
          Top = 23
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Subtotal'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit12PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Visible = False
          Width = 121
        end
        object cxLabel19: TcxLabel
          Left = 431
          Top = 25
          Hint = ''
          Caption = 'Subtotal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxCurrencyEdit1: TcxCurrencyEdit
          Left = 487
          Top = 23
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 6
          Width = 121
        end
        object cxCurrencyEdit2: TcxCurrencyEdit
          Left = 487
          Top = 45
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 7
          Width = 121
        end
        object cxCurrencyEdit3: TcxCurrencyEdit
          Left = 487
          Top = 67
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 8
          Width = 121
        end
      end
      object grbDetalles: TcxGroupBox
        Left = 0
        Top = 177
        Hint = ''
        Align = alClient
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 269
        Width = 790
        object cxGrid1: TcxGrid
          Tag = 1
          Left = 3
          Top = 22
          Width = 784
          Height = 244
          Hint = ''
          Align = alClient
          TabOrder = 0
          OnEnter = cxGrid1Enter
          OnExit = cxGrid1Exit
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView3: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnEditKeyDown = cxGridDBTableView3EditKeyDown
            DataController.DataSource = dsDetalleFactura
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.NoDataToDisplayInfoText = '<No Hay Informacion Para Desplegar>'
            OptionsView.GroupByBox = False
            object cxGridDBTableView3ProductoID: TcxGridDBColumn
              Tag = 1
              Caption = 'Producto'
              DataBinding.FieldName = 'ProductoID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3ProductoIDPropertiesValidate
              Options.Editing = False
            end
            object cxGridDBTableView3Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'Descripcion'
              Options.Editing = False
              Options.Focusing = False
              Width = 280
            end
            object cxGridDBTableView3Cantidad: TcxGridDBColumn
              DataBinding.FieldName = 'Cantidad'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3CantidadPropertiesValidate
              Options.Editing = False
              Width = 89
            end
            object cxGridDBTableView3Precio: TcxGridDBColumn
              DataBinding.FieldName = 'Precio'
              Options.Editing = False
              Options.Focusing = False
              Width = 71
            end
            object cxGridDBTableView3Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3ImportePropertiesValidate
              Options.Editing = False
              Width = 100
            end
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGridDBTableView3
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Tickets '
      ImageIndex = 21
      object cxGroupBox7: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        Align = alClient
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 0
        Height = 539
        Width = 790
        object cxGrid2: TcxGrid
          Left = 2
          Top = 5
          Width = 786
          Height = 532
          Hint = ''
          Align = alClient
          TabOrder = 0
          OnEnter = cxGrid2Enter
          OnExit = cxGrid2Exit
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView4: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsTicketFactura
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
                Column = cxGridDBColumn10
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '##,###,##0.#0'
                Kind = skSum
                Column = cxGridDBColumn10
              end
              item
                Kind = skSum
                Column = cxGridDBColumn12
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Haga Click Aqui Para A'#241'adir un Ticket'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.NoDataToDisplayInfoText = '<No Hay Informacion Para Desplegar>'
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object cxGridDBColumn6: TcxGridDBColumn
              DataBinding.FieldName = 'TicketID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView1TicketIDPropertiesValidate
              Width = 81
            end
            object cxGridDBColumn7: TcxGridDBColumn
              DataBinding.FieldName = 'Fecha'
              PropertiesClassName = 'TcxDateEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 109
            end
            object cxGridDBColumn8: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
              Options.Editing = False
              Options.Focusing = False
              Width = 62
            end
            object cxGridDBColumn9: TcxGridDBColumn
              DataBinding.FieldName = 'Nombre'
              Options.Editing = False
              Options.Focusing = False
              Width = 167
            end
            object cxGridDBColumn10: TcxGridDBColumn
              DataBinding.FieldName = 'Volumen'
              Options.Editing = False
              Options.Focusing = False
            end
            object cxGridDBColumn11: TcxGridDBColumn
              DataBinding.FieldName = 'Precio'
              Options.Editing = False
              Options.Focusing = False
            end
            object cxGridDBColumn12: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Editing = False
              Options.Focusing = False
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = cxGridDBTableView4
          end
        end
        object cxComboBox1: TcxComboBox
          Left = 504
          Top = 348
          Hint = ''
          TabStop = False
          TabOrder = 1
          Text = 'cbxListaTicket'
          Visible = False
          Width = 121
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Cupones  '
      ImageIndex = 23
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 790
        Height = 539
        Hint = ''
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView5: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDetalleCupon
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '##,###,##0.#0'
              Kind = skSum
            end
            item
              Format = '##,###,##0.#0'
              Kind = skSum
            end
            item
              Format = '##,###,##0.#0'
              Kind = skSum
              Column = cxGridDBTableView5TotalCalculado
            end>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxGridDBTableView5Cantidad: TcxGridDBColumn
            DataBinding.FieldName = 'Cantidad'
            Width = 127
          end
          object cxGridDBTableView5Denom: TcxGridDBColumn
            DataBinding.FieldName = 'Denominacion'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Denominacion'
            Properties.ListColumns = <
              item
                FieldName = 'Denominacion'
              end>
            Properties.ListSource = dsDenominacion
            Properties.OnValidate = cxGridDBTableView5DenomPropertiesValidate
            Width = 132
          end
          object cxGridDBTableView5Referencia: TcxGridDBColumn
            DataBinding.FieldName = 'Referencia'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Width = 175
          end
          object cxGridDBTableView5TotalCalculado: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'TotalCalculado'
            Options.Editing = False
            Options.Focusing = False
            Width = 97
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = cxGridDBTableView5
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Vales Cr'#233'dito'
      ImageIndex = 33
      object cbxListaVales: TcxComboBox
        Left = 522
        Top = 390
        Hint = ''
        TabOrder = 0
        Text = 'cbxListaVales'
        Visible = False
        Width = 89
      end
      object cxGroupBox4: TcxGroupBox
        Left = 312
        Top = 0
        Hint = ''
        Caption = 'Notas a Facturar'
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 1
        Height = 411
        Width = 320
        object grdVales: TcxGrid
          Left = 2
          Top = 18
          Width = 316
          Height = 391
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object grdValesDBTableView1: TcxGridDBTableView
            OnDblClick = grdValesDBTableView1DblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleValesFactura
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '##,###,##0.#0'
                Kind = skSum
                Column = grdValesDBTableView1Importe
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object grdValesDBTableView1NoVale: TcxGridDBColumn
              DataBinding.FieldName = 'NoVale'
              Options.Editing = False
              Options.Focusing = False
              Width = 132
            end
            object grdValesDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Editing = False
              Options.Focusing = False
            end
          end
          object grdValesLevel1: TcxGridLevel
            GridView = grdValesDBTableView1
          end
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 3
        Top = 0
        Hint = ''
        Caption = 'Notas por Facturar'
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 2
        Height = 411
        Width = 303
        object cxGrid5: TcxGrid
          Left = 2
          Top = 18
          Width = 299
          Height = 391
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView6: TcxGridDBTableView
            OnDblClick = cxGridDBTableView6DblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsVales
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '##,###,##0.#0'
                Kind = skSum
                Column = cxGridDBColumn3
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'Vale'
              DataBinding.FieldName = 'NoVale'
              Options.Editing = False
              Options.Focusing = False
              Width = 108
            end
            object cxGridDBColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'Fecha'
              Options.Editing = False
              Options.Focusing = False
              Width = 89
            end
            object cxGridDBColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Editing = False
              Options.Focusing = False
              Width = 65
            end
          end
          object cxGridLevel6: TcxGridLevel
            GridView = cxGridDBTableView6
          end
        end
      end
    end
  end
  object cdsCliente: TDACDSDataTable
    Fields = <
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'Codigo'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 80
      end
      item
        Name = 'Grupo'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Calle'
        DataType = datString
        Size = 60
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Ciudad'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Telefono'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 5
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 15
      end
      item
        Name = 'Curp'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Status'
        DataType = datBoolean
      end
      item
        Name = 'AutorizaCheque'
        DataType = datBoolean
      end
      item
        Name = 'TicketBoucher'
        DataType = datBoolean
      end
      item
        Name = 'AutorizaValeCredito'
        DataType = datBoolean
      end
      item
        Name = 'CuentaContableAnticipo'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContableCredito'
        DataType = datString
        Size = 20
      end
      item
        Name = 'LimiteCredito'
        DataType = datFloat
      end
      item
        Name = 'Credito'
        DataType = datBoolean
      end
      item
        Name = 'DiasCredito'
        DataType = datInteger
      end
      item
        Name = 'NIP'
        DataType = datInteger
      end
      item
        Name = 'FacturayLiquidacion'
        DataType = datBoolean
      end
      item
        Name = 'ApellidoPaterno'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ApellidoMaterno'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Nombres'
        DataType = datString
        Size = 50
      end
      item
        Name = 'email'
        DataType = datString
        Size = 100
      end
      item
        Name = 'Nacimiento'
        DataType = datDateTime
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Telefonos'
        DataType = datMemo
      end
      item
        Name = 'FacturaExpress'
        DataType = datBoolean
      end
      item
        Name = 'Saldo'
        DataType = datFloat
      end
      item
        Name = 'PuntosCategoriaID'
        DataType = datInteger
      end
      item
        Name = 'FechaAltaCliente'
        DataType = datDateTime
      end
      item
        Name = 'FechaAltaExpress'
        DataType = datDateTime
      end
      item
        Name = 'RegistroCliente'
        DataType = datDateTime
      end
      item
        Name = 'RegistroExpress'
        DataType = datDateTime
      end
      item
        Name = 'Sexo'
        DataType = datInteger
      end
      item
        Name = 'MostrarLiquidacion'
        DataType = datBoolean
      end
      item
        Name = 'PuntosClubID'
        DataType = datInteger
      end
      item
        Name = 'NoExterior'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Localidad'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Municipio'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Estado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'ObtenerDatosCliente'
    Params = <
      item
        Name = 'ClienteID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 64
    Top = 360
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 64
    Top = 392
  end
  object dsProducto: TDADataSource
    DataSet = cdsProducto.Dataset
    DataTable = cdsProducto
    Left = 96
    Top = 392
  end
  object cdsProducto: TDACDSDataTable
    Fields = <
      item
        Name = 'ProductoID'
        DataType = datInteger
      end
      item
        Name = 'Codigo'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PrecioVenta'
        DataType = datFloat
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Costo'
        DataType = datFloat
      end
      item
        Name = 'Status'
        DataType = datBoolean
      end
      item
        Name = 'Barras'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaContableCompra'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContableVenta'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Inventariable'
        DataType = datBoolean
      end
      item
        Name = 'CostoPromedio'
        DataType = datFloat
      end
      item
        Name = 'CategoriaID'
        DataType = datInteger
      end
      item
        Name = 'IEPS'
        DataType = datFloat
      end>
    LogChanges = False
    LogicalName = 'spProducto'
    Params = <
      item
        Name = 'EstacionID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 96
    Top = 360
  end
  object dsDetalleFactura: TDADataSource
    DataSet = cdsDetalleFactura.Dataset
    DataTable = cdsDetalleFactura
    Left = 32
    Top = 392
  end
  object dsFactura: TDADataSource
    DataSet = cdsFactura.Dataset
    DataTable = cdsFactura
    Top = 390
  end
  object cdsFormaPago: TDACDSDataTable
    Fields = <
      item
        Name = 'FormaPagoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
        Required = True
      end>
    LogicalName = 'dbo FormaPago'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 128
    Top = 360
  end
  object dsFormaPago: TDADataSource
    DataSet = cdsFormaPago.Dataset
    DataTable = cdsFormaPago
    Left = 128
    Top = 392
  end
  object cdsEmpresa: TDACDSDataTable
    Fields = <
      item
        Name = 'EmpresaID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 70
        Required = True
      end
      item
        Name = 'RazonSocial'
        DataType = datString
        Size = 70
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'NoBombas'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 80
      end
      item
        Name = 'Ciudad'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Host'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Impuesto'
        DataType = datFloat
        Required = True
      end>
    LogChanges = False
    LogicalName = 'ObtenerDatosEstacion'
    Params = <
      item
        Name = 'EstacionID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 416
    Top = 360
  end
  object dsEstacion: TDADataSource
    DataSet = cdsEmpresa.Dataset
    DataTable = cdsEmpresa
    Left = 416
    Top = 392
  end
  object dsTicketFactura: TDADataSource
    DataSet = cdsTicketFactura.Dataset
    DataTable = cdsTicketFactura
    Left = 160
    Top = 393
  end
  object cdsTipoFactura: TDACDSDataTable
    Fields = <
      item
        Name = 'TipoFacturaID'
        DataType = datInteger
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo TipoFactura'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 192
    Top = 360
  end
  object dsTipoFactura: TDADataSource
    DataSet = cdsTipoFactura.Dataset
    DataTable = cdsTipoFactura
    Left = 192
    Top = 392
  end
  object cdsCupones: TDACDSDataTable
    Fields = <
      item
        Name = 'CuponID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Importe'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Status'
        DataType = datString
        Size = 1
        Required = True
      end
      item
        Name = 'Ticket'
        DataType = datInteger
      end
      item
        Name = 'FechaEmision'
        DataType = datDateTime
      end
      item
        Name = 'FechaConsumo'
        DataType = datDateTime
      end
      item
        Name = 'EjercicioEmision'
        DataType = datInteger
      end
      item
        Name = 'PeriodoEmision'
        DataType = datInteger
      end
      item
        Name = 'DiaEmision'
        DataType = datInteger
      end
      item
        Name = 'EjercicioConsumo'
        DataType = datInteger
      end
      item
        Name = 'PeriodoConsumo'
        DataType = datInteger
      end
      item
        Name = 'DiaConsumo'
        DataType = datInteger
      end
      item
        Name = 'Barras'
        DataType = datString
        Size = 50
        Required = True
      end
      item
        Name = 'Secuencia'
        DataType = datInteger
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'LiquidacionID'
        DataType = datInteger
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
      end
      item
        Name = 'DetalleCuponID'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'Total'
        DataType = datFloat
        LogChanges = False
        Calculated = True
      end>
    LogicalName = 'dbo Cupon'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 224
    Top = 360
  end
  object dsCupones: TDADataSource
    DataSet = cdsCupones.Dataset
    DataTable = cdsCupones
    Left = 224
    Top = 392
  end
  object dsDetalleCupon: TDADataSource
    DataSet = cdsDetalleCupon.Dataset
    DataTable = cdsDetalleCupon
    Left = 256
    Top = 392
  end
  object cdsDetalleCupon: TDACDSDataTable
    DetailFields = 'FacturaID'
    Fields = <
      item
        Name = 'DetalleCuponID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Denominacion'
        DataType = datInteger
      end
      item
        Name = 'Cantidad'
        DataType = datInteger
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Denom'
        DataType = datInteger
        LogChanges = False
        Alignment = taRightJustify
        Lookup = True
        LookupSource = dsDenominacion
        LookupKeyFields = 'Denominacion'
        LookupResultField = 'Denominacion'
        KeyFields = 'Denominacion'
        LookupCache = True
      end
      item
        Name = 'Total'
        DataType = datFloat
        LogChanges = False
        DisplayFormat = '##,###,##0.#0'
        EditFormat = '##,###,##0.#0'
        Alignment = taRightJustify
        Calculated = True
      end
      item
        Name = 'TotalCalculado'
        DataType = datFloat
        LogChanges = False
        DisplayFormat = '##,###,##0.#0'
        EditFormat = '##,###,##0.#0'
        Alignment = taRightJustify
        Calculated = True
      end>
    LogicalName = 'dbo DetalleCupon'
    MasterFields = 'FacturaID'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    MasterSource = dsFactura
    Params = <
      item
        Name = 'FacturaID'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    BeforePost = cdsDetalleCuponBeforePost
    OnCalcFields = cdsDetalleCuponCalcFields
    OnNewRecord = cdsDetalleCuponNewRecord
    IndexDefs = <>
    Left = 256
    Top = 360
  end
  object dsDenominacion: TDADataSource
    DataSet = cdsDenominacion.Dataset
    DataTable = cdsDenominacion
    Left = 288
    Top = 392
  end
  object cdsDenominacion: TDACDSDataTable
    Fields = <
      item
        Name = 'Denominacion'
        DataType = datInteger
        Required = True
      end>
    LogicalName = 'dbo Denominacion'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    BeforePost = cdsDetalleCuponBeforePost
    OnCalcFields = cdsDetalleCuponCalcFields
    OnNewRecord = cdsDetalleCuponNewRecord
    IndexDefs = <>
    Left = 288
    Top = 360
  end
  object cdsTicketFactura: TDACDSDataTable
    DetailFields = 'FacturaID'
    Fields = <
      item
        Name = 'TicketFacturaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TicketID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
      end
      item
        Name = 'Volumen'
        DataType = datFloat
      end
      item
        Name = 'Precio'
        DataType = datFloat
      end
      item
        Name = 'Importe'
        DataType = datFloat
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
        LogChanges = False
        DisplayWidth = 30
        Lookup = True
        LookupSource = dsProducto
        LookupKeyFields = 'ProductoID'
        LookupResultField = 'Nombre'
        KeyFields = 'ProductoID'
        LookupCache = True
      end>
    LogicalName = 'TicketFactura'
    MasterFields = 'FacturaID'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    MasterSource = dsFactura
    Params = <
      item
        Name = 'FacturaID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsTicketFacturaAfterPost
    BeforeDelete = cdsTicketFacturaBeforeDelete
    BeforePost = cdsTicketFacturaBeforePost
    OnNewRecord = cdsTicketFacturaNewRecord
    IndexDefs = <>
    Left = 160
    Top = 360
  end
  object cdsDetalleFactura: TDACDSDataTable
    DetailFields = 'FacturaID'
    Fields = <
      item
        Name = 'DetalleFacturaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Cantidad'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Precio'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Importe'
        DataType = datFloat
      end
      item
        Name = 'ItemNo'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 30
        LogChanges = False
        DisplayLabel = 'Descripci'#243'n'
        Lookup = True
        LookupSource = dsProducto
        LookupKeyFields = 'ProductoID'
        LookupResultField = 'Nombre'
        KeyFields = 'ProductoID'
        LookupCache = True
      end>
    LogicalName = 'DetalleFactura'
    MasterFields = 'FacturaID'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    MasterSource = dsFactura
    Params = <
      item
        Name = 'FacturaID'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsDetalleFacturaAfterPost
    BeforeDelete = cdsDetalleFacturaBeforeDelete
    BeforePost = cdsDetalleFacturaBeforePost
    OnNewRecord = cdsDetalleFacturaNewRecord
    IndexDefs = <>
    Left = 32
    Top = 360
  end
  object cdsFactura: TDACDSDataTable
    Fields = <
      item
        Name = 'FacturaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Folio'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Serie'
        DataType = datString
        Size = 5
        Required = True
      end
      item
        Name = 'Ejercicio'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Periodo'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Dia'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'Subtotal'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Impuesto'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Total'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Turno'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Cancelada'
        DataType = datBoolean
        Required = True
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'LiquidacionID'
        DataType = datInteger
      end
      item
        Name = 'FormaPagoID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'TipoFacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Tickets'
        DataType = datWideString
        Size = 250
      end>
    LogicalName = 'dbo Factura'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsFacturaAfterPost
    BeforePost = cdsFacturaBeforePost
    OnNewRecord = cdsFacturaNewRecord
    IndexDefs = <>
    Top = 360
  end
  object cdsDetalleValesFactura: TDACDSDataTable
    DetailFields = 'FacturaID'
    Fields = <
      item
        Name = 'DetalleValeCreditoFacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'NoVale'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Importe'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'CarteraValeCreditoID'
        DataType = datInteger
      end>
    LogicalName = 'DetalleValeCreditoFactura'
    MasterFields = 'FacturaID'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    MasterSource = dsFactura
    Params = <
      item
        Name = 'FacturaID'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsDetalleValesFacturaAfterPost
    BeforeDelete = cdsDetalleValesFacturaBeforeDelete
    OnNewRecord = cdsDetalleValesFacturaNewRecord
    IndexDefs = <>
    Left = 352
    Top = 360
  end
  object dsDetalleValesFactura: TDADataSource
    DataSet = cdsDetalleValesFactura.Dataset
    DataTable = cdsDetalleValesFactura
    Left = 352
    Top = 392
  end
  object cdsVales: TDACDSDataTable
    Fields = <
      item
        Name = 'CarteraValeCreditoID'
        DataType = datInteger
      end
      item
        Name = 'NoVale'
        DataType = datInteger
      end
      item
        Name = 'Ticket'
        DataType = datInteger
      end
      item
        Name = 'Importe'
        DataType = datFloat
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
      end
      item
        Name = 'Ejercicio'
        DataType = datInteger
      end
      item
        Name = 'Periodo'
        DataType = datInteger
      end
      item
        Name = 'Dia'
        DataType = datInteger
      end
      item
        Name = 'Status'
        DataType = datString
        Size = 10
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'LiquidacionDetalleID'
        DataType = datInteger
      end>
    LogicalName = 'ValesPendientes'
    Params = <
      item
        Name = 'ClienteID'
        Value = '2'
        ParamType = daptInput
      end
      item
        Name = 'EstacionID'
        Value = '7073'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 320
    Top = 360
  end
  object dsVales: TDADataSource
    DataSet = cdsVales.Dataset
    DataTable = cdsVales
    Left = 320
    Top = 392
  end
  object cdsComparaFechas: TDACDSDataTable
    Fields = <
      item
        Name = 'Diferencia'
        DataType = datInteger
      end>
    LogicalName = 'ComparaFechas'
    Params = <
      item
        Name = 'FechaServidor'
        Value = ''
        ParamType = daptInput
      end
      item
        Name = 'FechaFactura'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 384
    Top = 360
  end
  object dsComparaFechas: TDADataSource
    DataSet = cdsComparaFechas.Dataset
    DataTable = cdsComparaFechas
    Left = 384
    Top = 392
  end
end