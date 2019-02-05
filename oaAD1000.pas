Unit oaAD1000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaAD1000
// FORMULARIO               : FParametros
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de parámetros generales

// ACTUALIZACIONES:
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 09/09/2016   Se implementó opción de mentenimiento de texto del tickets
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000
// LOG_201805     19/11/2018   Cambio de Control de Versión a LOG-201805, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, db, ExtCtrls, StdCtrls;

Type
   TFParametros = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;
Procedure ADParametros; stdcall;
Procedure ADListaPrecios; stdcall;
Procedure ADEnviaListaPrecios; stdcall;
Procedure ADVerificaVersion; stdcall;
Procedure ADTextoTicketsIngreso; stdcall;

Exports
   ADParametros,
   ADListaPrecios,
   ADEnviaListaPrecios,
   ADVerificaVersion,
   ADTextoTicketsIngreso;
Var
   FParametros: TFParametros;
   GLPrecio: TMant;
   Mtx: TMant;

Implementation

{$R *.dfm}

Uses LOGDM1, LOG260, LOG261, LOG120;

Procedure ADParametros;
Var
   MRefe: TMant;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010101') Then Exit;

   Application.Initialize;
   Try
      MRefe := TMant.Create(Application);
      MRefe.Module := DMLOG.wModulo;
      MRefe.Admin := DMLOG.wAdmin;
      MRefe.DComC := DMLOG.DCOM1;
      MRefe.User := DMLOG.wUsuario;
      MRefe.OnCierra := DMLOG.DisminuyeForma;
      MRefe.Execute;
   Except
   End;
End;

Procedure ADListaPrecios;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010102') Then Exit;

   Application.Initialize;
// LOG260 Lista de Precios
   FLisPre := TFLisPre.Create(Application);
   Try
      FLisPre.ActiveMDIChild;
   Finally

   End;
End;

Procedure ADEnviaListaPrecios;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010103') Then Exit;
// Fin HPC_201601_LOG

   Application.Initialize;
// LOG261
   FLisPre1 := TFLisPre1.Create(Application);
   Try
      FLisPre1.ActiveMDIChild;
   Finally
   End;
   DMLOG.cdsArti.Close;
End;

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FParametros := TFParametros.Create(Application);
   If DMLOG.fg_VerificaVersion(FParametros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

Procedure ADTextoTicketsIngreso; Stdcall;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010104') Then Exit;

   Application.Initialize;
// LOG120
   FTextoTickets := TFTextoTickets.Create(Application);
   Try
      FTextoTickets.ActiveMDIChild;
   Finally
   End;
End;

End.

