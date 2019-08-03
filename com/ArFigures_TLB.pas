unit ArFigures_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 09/10/2005 02:42:36 Õ from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\work\delphi\projects\ArabicFigures\com\ArFigures.tlb (1)
// LIBID: {8E5FF81D-D499-45DA-BCEA-39A6266CEC25}
// LCID: 0
// Helpfile: 
// HelpString: ArFigures Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ArFiguresMajorVersion = 1;
  ArFiguresMinorVersion = 0;

  LIBID_ArFigures: TGUID = '{8E5FF81D-D499-45DA-BCEA-39A6266CEC25}';

  IID_IFigure: TGUID = '{6DFAB71D-F388-4F45-9C89-6F24313D3435}';
  CLASS_Figure: TGUID = '{935FAE78-F2AF-48AC-8F4E-3EF74958308C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFigure = interface;
  IFigureDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Figure = IFigure;


// *********************************************************************//
// Interface: IFigure
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6DFAB71D-F388-4F45-9C89-6F24313D3435}
// *********************************************************************//
  IFigure = interface(IDispatch)
    ['{6DFAB71D-F388-4F45-9C89-6F24313D3435}']
    function About: WideString; safecall;
    function Extended(Number: Double; const Name: WideString; const Dual1: WideString; 
                      const Dual2: WideString; const Plural: WideString; Gender: WordBool): WideString; safecall;
    function Simple(const Number: WideString; const CurrencyName: WideString; 
                    const PartName: WideString; Decimals: Integer; Gender: WordBool): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IFigureDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6DFAB71D-F388-4F45-9C89-6F24313D3435}
// *********************************************************************//
  IFigureDisp = dispinterface
    ['{6DFAB71D-F388-4F45-9C89-6F24313D3435}']
    function About: WideString; dispid 201;
    function Extended(Number: Double; const Name: WideString; const Dual1: WideString; 
                      const Dual2: WideString; const Plural: WideString; Gender: WordBool): WideString; dispid 202;
    function Simple(const Number: WideString; const CurrencyName: WideString; 
                    const PartName: WideString; Decimals: Integer; Gender: WordBool): WideString; dispid 203;
  end;

// *********************************************************************//
// The Class CoFigure provides a Create and CreateRemote method to          
// create instances of the default interface IFigure exposed by              
// the CoClass Figure. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFigure = class
    class function Create: IFigure;
    class function CreateRemote(const MachineName: string): IFigure;
  end;

implementation

uses ComObj;

class function CoFigure.Create: IFigure;
begin
  Result := CreateComObject(CLASS_Figure) as IFigure;
end;

class function CoFigure.CreateRemote(const MachineName: string): IFigure;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Figure) as IFigure;
end;

end.
