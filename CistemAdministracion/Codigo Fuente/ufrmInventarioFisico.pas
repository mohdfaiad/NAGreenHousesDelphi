unit ufrmInventarioFisico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBEdit, cxPC, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLabel, cxContainer, cxGroupBox, ExtCtrls, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxDBLookupComboBox, cxLookupEdit,
  cxDBLookupEdit, cxCheckBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxLookAndFeels, cxLookAndFeelPainters, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, uDAInterfaces;

type
  TFrmInventarioFisico = class(TfrmCustomModule)
    dsProducto: TDADataSource;
    cdsProducto: TDACDSDataTable;
    dsDetalleTransaccion: TDADataSource;
    dsTransaccion: TDADataSource;
    cdsEstacion: TDACDSDataTable;
    dsEstacion: TDADataSource;
    pgcFacturacion: TcxPageControl;
    cdsTransaccion: TDACDSDataTable;
    cdsDetalleTransaccion: TDACDSDataTable;
    cxPagTraspaso: TcxPageControl;
    cxTabInventario: TcxTabSheet;
    grbEncabezado: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel8: TcxLabel;
    dbTxtFolio: TcxDBTextEdit;
    dbDatFecha: TcxDBDateEdit;
    cxGroupBox6: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cdsAlmacen: TDACDSDataTable;
    dsAlmacen: TDADataSource;
    cdsDetalleMovimiento: TDACDSDataTable;
    dsDetalleMovimiento: TDADataSource;
    cdsMovimientoAlmacen: TDACDSDataTable;
    dsMovimientoAlmacen: TDADataSource;
    cdsInventario: TDACDSDataTable;
    dsInventario: TDADataSource;
    dsDetalleInventario: TDADataSource;
    cdsDetalleInventario: TDACDSDataTable;
    cxGridDBTableView3ExistenciaTeorica: TcxGridDBColumn;
    cxGridDBTableView3ExistenciaFisica: TcxGridDBColumn;
    cxGridDBTableView3Diferencia: TcxGridDBColumn;
    cxGridDBTableView3ProductoID: TcxGridDBColumn;
    cxGridDBTableView3Nombre: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    cdsDespachador: TDACDSDataTable;
    dsDespachador: TDADataSource;
    dbCbxDespachador: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    dbCbxAlmacenOrigen: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cdsTransaccionNewRecord(DataTable: TDADataTable);
    procedure cdsDetalleTransaccionNewRecord(DataTable: TDADataTable);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cdsTransaccionBeforePost(DataTable: TDADataTable);
    procedure cxGridDBTableView3ProductoIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cdsInventarioBeforePost(DataTable: TDADataTable);
    procedure cdsDetalleInventarioNewRecord(DataTable: TDADataTable);
    procedure cdsInventarioNewRecord(DataTable: TDADataTable);
    procedure cdsDetalleInventarioBeforePost(DataTable: TDADataTable);
    procedure cdsInventarioAfterPost(DataTable: TDADataTable);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure EliminarNulos;
    procedure AfectarInventario;
    function ExisteProducto(ProductoID:Integer):Boolean;
    procedure BuscarProducto;
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  FrmInventarioFisico: TFrmInventarioFisico;
  ImpuestoPorcentaje:Real;
  EstacionActual:Integer;
  Consulta:Byte;

implementation

  uses Modules, uDM, dmActions, ufrmBuscarProveedor,
  LibraryEmpresas_Intf, UtileriasComun, ufrmBuscarProducto;

{$R *.dfm}

procedure TFrmInventarioFisico.ActionNuevo(Action: TBasicAction);
begin
  dbTxtFolio.Enabled:=True;
  dbCbxAlmacenOrigen.Enabled:=True;
  dbCbxDespachador.Enabled:=True;
  cxGrid1.Enabled:=True;
  cdsInventario.Append;
  grbEncabezado.SetFocus;
  dbCbxAlmacenOrigen.SetFocus;
end;

procedure TFrmInventarioFisico.AfectarInventario;
begin
  cdsTransaccion.Append;
  cdsDetalleInventario.First;
  While not cdsDetalleInventario.EOF do
  begin
    cdsDetalleTransaccion.Append;
    cdsDetalleTransaccion.FieldByName('ProductoID').AsInteger:= cdsDetalleInventario.FieldByName('ProductoID').AsInteger;
    cdsDetalleTransaccion.FieldByName('Cantidad').AsFloat:=cdsDetalleInventario.FieldByName('Diferencia').AsFloat;
    cdsDetalleTransaccion.FieldByName('Costo').AsFloat:=DM.Servidor.CostoProducto(cdsDetalleTransaccion.FieldByName('ProductoID').AsInteger);
    cdsDetalleTransaccion.Post;
    cdsDetalleInventario.Next;
  end;
  cdsMovimientoAlmacen.Open;
  cdsDetalleMovimiento.Open;
  {Afectando al almacen origen}
  cdsMovimientoAlmacen.Append;
  cdsMovimientoAlmacen.FieldByName('MovimientoAlmacen').AsInteger:=DM.Servidor.Folio('MovimientoAlmacen','');
  cdsMovimientoAlmacen.FieldByName('AlmacenID').AsInteger:=cdsTransaccion.FieldByName('AlmacenID').AsInteger;
  cdsMovimientoAlmacen.FieldByName('EstacionID').AsInteger:=cdsTransaccion.FieldByName('EstacionID').AsInteger;
  cdsDetalleTransaccion.First;
  while not cdsDetalleTransaccion.EOF do
  begin
    cdsDetalleMovimiento.Append;
    cdsDetalleMovimiento.FieldByName('DetalleMovimientoID').AsInteger:=DM.Servidor.Folio('DetalleMovimientoID','');
    cdsDetalleMovimiento.FieldByName('Tipo').AsString:=cdsTransaccion.FieldByName('Tipo').AsString;
    if cdsDetalleTransaccion.FieldByName('Cantidad').AsFloat > 0 then
      cdsDetalleMovimiento.FieldByName('Operador').AsInteger:=-1
    else
      cdsDetalleMovimiento.FieldByName('Operador').AsInteger:=1;
    cdsDetalleMovimiento.FieldByName('Cantidad').AsFloat:=Abs(cdsDetalleTransaccion.FieldByName('Cantidad').AsFloat);
    cdsDetalleMovimiento.FieldByName('Costo').AsFloat:=cdsDetalleTransaccion.FieldByName('Costo').AsFloat;
    cdsDetalleMovimiento.FieldByName('MovimientoAlmacen').AsInteger:=cdsMovimientoAlmacen.FieldByName('MovimientoAlmacen').AsInteger;
    cdsDetalleMovimiento.FieldByName('ProductoID').AsInteger:=cdsDetalleTransaccion.FieldByName('ProductoID').AsInteger;
    cdsDetalleMovimiento.FieldByName('TransaccionID').AsInteger:=cdsTransaccion.FieldByName('TransaccionID').AsInteger;
    cdsDetalleMovimiento.Post;
    cdsDetalleTransaccion.Next;
  end;
  cdsMovimientoAlmacen.Post;
  cdsTransaccion.Post;
end;

procedure TFrmInventarioFisico.BuscarProducto;
begin
  frmBuscarProducto:=TfrmBuscarProducto.Create(Self);
  frmBuscarProducto.IniciarBusqueda(2);
  frmBuscarProducto.ShowModal;
  if frmBuscarProducto.OK then
  begin
    if (cdsDetalleInventario.State = dsBrowse) then
      cdsDetalleInventario.Append;
    cdsDetalleInventario.FieldByName('ProductoID').AsInteger:=frmBuscarProducto.Clave;
    cdsDetalleInventario.FieldByName('ExistenciaTeorica').AsFloat:=DM.Servidor.Existencia(EstacionActual,cdsInventario.FieldByName('AlmacenID').AsInteger,cdsDetalleInventario.FieldByName('ProductoID').AsInteger,DM.Servidor.Fecha);
  end;
end;

procedure TFrmInventarioFisico.ActionGuardar(Action: TBasicAction);
begin
  if cdsDetalleInventario.RecordCount > 0 then
  begin
    if (cdsDetalleInventario.State = dsEdit) or
      (cdsDetalleInventario.State = dsInsert) then
      cdsDetalleInventario.Cancel;
    cdsInventario.Post;
  end
  else
    Showmessage('Registre al menos un Producto');
end;

procedure TFrmInventarioFisico.ActionCancelar(Action: TBasicAction);
begin
  dbTxtFolio.Enabled:=False;
  dbCbxAlmacenOrigen.Enabled:=False;
  dbCbxDespachador.Enabled:=False;
  cxGrid1.Enabled:=False;
  cdsDetalleInventario.Cancel;
  cdsInventario.Cancel;
end;

procedure TFrmInventarioFisico.ActionBuscar(Action: TBasicAction);
begin
  case Consulta of
    1:BuscarProducto;
  end;
end;

procedure TFrmInventarioFisico.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TFrmInventarioFisico.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsInventario.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=(cdsInventario.State in dsEditModes);
  dmAppActions.actCancelar.Enabled:=cdsInventario.State in dsEditModes;
  dmAppActions.actEliminar.Enabled:=(cdsInventario.State = dsBrowse) and (cdsInventario.RecordCount > 0);
  dmAppActions.actBuscar.Enabled:=((cdsInventario.State=dsEdit) or (cdsInventario.State=dsInsert));
end;

procedure TFrmInventarioFisico.cdsDetalleInventarioBeforePost(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleInventario.FieldByName('Diferencia').AsFloat:=cdsDetalleInventario.FieldByName('ExistenciaTeorica').AsFloat -
                                                          cdsDetalleInventario.FieldByName('ExistenciaFisica').AsFloat;
end;

procedure TFrmInventarioFisico.cdsDetalleInventarioNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleInventario.FieldByName('DetalleInventarioFisicoID').AsInteger:=DM.Servidor.Folio('DetalleInventarioFisicoID','');
  cdsDetalleInventario.FieldByName('ExistenciaFisica').AsFloat:=0;
  cdsDetalleInventario.FieldByName('ExistenciaTeorica').AsFloat:=0;
end;

procedure TFrmInventarioFisico.cdsDetalleTransaccionNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleTransaccion.FieldByName('DetalleTransaccionID').AsInteger:=DM.Servidor.Folio('DetalleTransaccionID','');
  cdsDetalleTransaccion.FieldByName('TransaccionID').AsInteger:=cdsTransaccion.FieldByName('TransaccionID').AsInteger;
  cdsDetalleTransaccion.FieldByName('Cantidad').AsFloat:=0;
  cdsDetalleTransaccion.FieldByName('Importe').AsFloat:=0;
end;

procedure TFrmInventarioFisico.cdsInventarioAfterPost(DataTable: TDADataTable);
begin
  inherited;
  cdsInventario.ApplyUpdates(true);
  cdsDetalleInventario.ApplyUpdates(true);
  cdsTransaccion.ApplyUpdates(true);
  cdsDetalleTransaccion.ApplyUpdates(true);
  cdsMovimientoAlmacen.ApplyUpdates(true);
  cdsDetalleMovimiento.ApplyUpdates(true);
end;

procedure TFrmInventarioFisico.cdsInventarioBeforePost(DataTable: TDADataTable);
begin
  inherited;
  cdsInventario.FieldByName('Folio').AsInteger:=DM.Servidor.Folio('FolioInventario','');
  EliminarNulos;
  AfectarInventario;
end;

procedure TFrmInventarioFisico.cdsInventarioNewRecord(DataTable: TDADataTable);
var
  Fecha:DateTime;
begin
  inherited;
   Fecha:=DM.Servidor.Fecha;
  cdsInventario.FieldByName('InventarioFisicoID').AsInteger:=DM.Servidor.Folio('InventarioFisicoID','');
  cdsInventario.FieldByName('Folio').AsInteger:=DM.Servidor.FolioActual('FolioInventario','');
  cdsInventario.FieldByName('Fecha').AsDateTime:=StrToDate(FormatDateTime('dd/mm/yyyy',Fecha));
  cdsInventario.FieldByName('Ejercicio').AsInteger:=StrToInt(FormatDateTime('yyyy',Fecha));
  cdsInventario.FieldByName('Periodo').AsInteger:=StrToInt(FormatDateTime('mm',Fecha));
  cdsInventario.FieldByName('Dia').AsInteger:=StrToInt(FormatDateTime('dd',Fecha));
end;

procedure TFrmInventarioFisico.cdsTransaccionBeforePost(DataTable: TDADataTable);
begin
  inherited;
  cdsTransaccion.FieldByName('Folio').AsInteger:=DM.Servidor.Folio('FolioCompra','');
end;

procedure TFrmInventarioFisico.cdsTransaccionNewRecord(DataTable: TDADataTable);
var
  Fecha:DateTime;
begin
  inherited;
  Fecha:=DM.Servidor.Fecha;
  cdsTransaccion.FieldByName('TransaccionID').AsInteger:=DM.Servidor.Folio('TransaccionID','');
  cdsTransaccion.FieldByName('Folio').AsInteger:=DM.Servidor.FolioActual('FolioCompra','');
  cdsTransaccion.FieldByName('Fecha').AsDateTime:=StrToDate(FormatDateTime('dd/mm/yyyy',Fecha));
  cdsTransaccion.FieldByName('Ejercicio').AsInteger:=StrToInt(FormatDateTime('yyyy',Fecha));
  cdsTransaccion.FieldByName('Periodo').AsInteger:=StrToInt(FormatDateTime('mm',Fecha));
  cdsTransaccion.FieldByName('Dia').AsInteger:=StrToInt(FormatDateTime('dd',Fecha));
  cdsTransaccion.FieldByName('Secuencia').AsInteger:=1;
  cdsTransaccion.FieldByName('EstacionID').AsInteger:=EstacionActual;
  cdsTransaccion.FieldByName('AlmacenID').AsInteger:=cdsInventario.FieldByName('AlmacenID').AsInteger;
  cdsTransaccion.FieldByName('Tipo').AsString:='IF';
  cdsTransaccion.FieldByName('Referencia').AsString:='.';
  cdsTransaccion.FieldByName('Total').AsFloat:=0;
  cdsTransaccion.FieldByName('Subtotal').AsFloat:=0;
  cdsTransaccion.FieldByName('Impuesto').AsFloat:=0;
  cdsTransaccion.FieldByName('Plazo').AsInteger:=0;
  cdsTransaccion.FieldByName('Credito').AsInteger:=0;
end;

procedure TFrmInventarioFisico.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  Consulta:=1;
end;

procedure TFrmInventarioFisico.cxGrid1Exit(Sender: TObject);
begin
  inherited;
  if (cdsDetalleTransaccion.State = dsEdit) or
    (cdsDetalleTransaccion.State = dsInsert) then
    cdsDetalleTransaccion.Cancel;
  Consulta:=0;
end;

procedure TFrmInventarioFisico.cxGridDBTableView3EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if Key=VK_F2 then
  begin
    case Consulta of
      1:BuscarProducto;
    end;
  end;
end;

procedure TFrmInventarioFisico.cxGridDBTableView3ProductoIDPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
    if ExisteProducto(DisplayValue) then
    begin
      cdsDetalleInventario.FieldByName('ExistenciaTeorica').AsFloat:=DM.Servidor.Existencia(EstacionActual,cdsInventario.FieldByName('AlmacenID').AsInteger,DisplayValue,DM.Servidor.Fecha);
      cdsDetalleInventario.FieldByName('ProductoID').AsInteger:=DisplayValue;
    end
    else
      Showmessage('Producto NO Existe o no es Inventariable');
  end;
end;

procedure TFrmInventarioFisico.FormCreate(Sender: TObject);
begin
  inherited;
  dbTxtFolio.Enabled:=False;
  dbCbxAlmacenOrigen.Enabled:=False;
  dbCbxDespachador.Enabled:=False;
  cxGrid1.Enabled:=False;
  EstacionActual:=StrToInt(UtileriasComun.LeerRegistro('Estacion','4120'));
  cdsAlmacen.Close;
  cdsAlmacen.ParamByName('EstacionID').asInteger:=EstacionActual;
  cdsAlmacen.Open;
  cdsEstacion.Close;
  cdsEstacion.ParamByName('EstacionID').asInteger:=EstacionActual;
  cdsEstacion.Open;
  cdsProducto.Close;
  cdsProducto.ParamByName('EstacionID').AsInteger:=EstacionActual;
  cdsProducto.ParamByName('Tipo').AsInteger:=2;
  cdsProducto.Open;
  cdsDespachador.Close;
  cdsDespachador.ParamByName('EstacionID').AsInteger:=EstacionActual;
  cdsDespachador.Open;
  cdsTransaccion.Open;
  cdsDetalleTransaccion.Open;
  cdsInventario.Open;
  cdsDetalleInventario.Open;
  ImpuestoPorcentaje:=cdsEstacion.FieldByName('Impuesto').AsFloat;
end;

procedure TFrmInventarioFisico.EliminarNulos;
begin
  while not cdsDetalleInventario.EOF  do
  begin
    if (cdsDetalleInventario.FieldByName('ProductoID').AsInteger=0) then
      cdsDetalleInventario.Delete;
    cdsDetalleInventario.Next;
  end;
end;


function TFrmInventarioFisico.ExisteProducto(ProductoID: Integer): Boolean;
begin
  Result:=cdsProducto.Locate('ProductoID',ProductoID, [loCaseInsensitive]);
end;

initialization
  ModuleInfoManager.RegisterModule('Inventario Fisico', TFrmInventarioFisico);
end.