module variables

  use decomp_2d, only : mytype

  ! Boundary conditions : ncl = 2 --> Dirichlet
  ! Boundary conditions : ncl = 1 --> Free-slip
  ! Boundary conditions : ncl = 0 --> Periodic
  ! l: power of 2,3,4,5 and 6
  ! if ncl = 1 or 2, --> n  = 2l+ 1
  !                  --> nm = n - 1
  !                  --> m  = n + 1
  ! If ncl = 0,      --> n  = 2*l
  !                  --> nm = n
  !                  --> m  = n + 2
  !nstat = size arrays for statistic collection
  !2-->every 2 mesh nodes
  !4-->every 4 mesh nodes
  !nvisu = size for visualization collection
  !nprobe =  size for probe collection (energy spectra)

!Possible n points: 3 5 7 9 11 13 17 19 21 25 31 33 37 41 49 51 55 61 65 73 81 91 97 101 109 121 129 145 151 161 163 181 193 201 217 241 251 257 271 289 301 321 325 361 385 401 433 451 481 487 501 513 541 577 601 641 649 721 751 769 801 811 865 901 961 973 1001 1025 1081 1153 1201 1251 1281 1297 1351 1441 1459 1501 1537 1601 1621 1729 1801 1921 1945 2001 2049 2161 2251 2305 2401 2431 2501 2561 2593 2701 2881 2917 3001 3073 3201 3241 3457 3601 3751 3841 3889 4001 4051 4097 4321 4375 4501 4609 4801 4861 5001 5121 5185 5401 5761 5833 6001 6145 6251 6401 6481 6751 6913 7201 7291 7501 7681 7777 8001 8101 8193 8641 8749 9001 9217 9601 9721 enough

  integer,parameter :: nx=999
  integer,parameter :: ny=999
  integer,parameter :: nz=999
  integer,parameter :: nstat=1,nvisu=1,nprobe=1,nlength=1
  integer,parameter :: nphi=1

  integer,parameter :: p_row=2
  integer,parameter :: p_col=2

  integer,parameter :: nxm=nx-1
  integer,parameter :: nym=ny-1
  integer,parameter :: nzm=nz-1


  real(mytype), dimension(nphi) :: nsc,uset,cp,ri,group
  real(mytype) :: group_amplitud,fpi2

#ifndef DOUBLE_PREC
  integer :: prec=4
#else
  integer :: prec=8
#endif

  !module filter
  real(mytype), dimension(nx) :: fifx,ficx,fibx,fiffx,fibbx,fiz1x,fiz2x
  real(mytype), dimension(nx,2) ::filax,filaxp
  real(mytype), dimension(nx) :: fifxp,ficxp,fibxp,fiffxp,fibbxp
  real(mytype), dimension(ny) :: fify,ficy,fiby,fiffy,fibby,fiz1y,fiz2y
  real(mytype), dimension(ny,2) ::filay,filayp
  real(mytype), dimension(ny) :: fifyp,ficyp,fibyp,fiffyp,fibbyp
  real(mytype), dimension(nz) :: fifz,ficz,fibz,fiffz,fibbz,fiz1z,fiz2z
  real(mytype), dimension(nz,2) ::filaz,filazp
  real(mytype), dimension(nz) :: fifzp,ficzp,fibzp,fiffzp,fibbzp
  integer, dimension(200) :: idata
  real(mytype), dimension(p_col*p_row) :: Cs

  !module derivative
  real(mytype), dimension(nx) :: ffx,fcx,fbx,sfx,scx,sbx,fsx,fwx,ssx,swx
  real(mytype), dimension(nx) :: ffxp,fsxp,fwxp,sfxp,ssxp,swxp
  real(mytype), dimension(ny) :: ffy,fcy,fby,sfy,scy,sby,fsy,fwy,ssy,swy
  real(mytype), dimension(ny) :: ffyp,fsyp,fwyp,sfyp,ssyp,swyp
  real(mytype), dimension(ny) :: fbyt,fcyt,ffyt,fsyt,fwyt !!temperature
  real(mytype), dimension(ny) :: fbyimp,fcyimp,ffyimp,fsyimp,fwyimp !!temperature (implicit time)
  real(mytype), dimension(ny) :: ffyS,fcyS,fbyS,sfyS,scyS,sbyS,fsyS,fwyS,ssyS,swyS
  real(mytype), dimension(ny) :: ffypS,fsypS,fwypS,sfypS,ssypS,swypS
  real(mytype), dimension(nz) :: ffz,fcz,fbz,sfz,scz,sbz,fsz,fwz,ssz,swz
  real(mytype), dimension(nz) :: ffzp,fszp,fwzp,sfzp,sszp,swzp
  real(mytype), save, allocatable, dimension(:,:) :: sx,vx
  real(mytype), save, allocatable, dimension(:,:) :: sy,vy
  real(mytype), save, allocatable, dimension(:,:) :: sz,vz
  real(mytype), dimension(ny) :: aam,bbm,ccm,ddm,eem,ggm,hhm,wwm,zzm !!TIME IMPLICIT
  real(mytype), dimension(ny) :: rrm,qqm,vvm,ssm !!TIME IMPLICIT (with HPL)
  real(mytype), dimension(ny) :: aamt,bbmt,ccmt,ddmt,eemt,ggmt,hhmt,wwmt,zzmt !!TIME IMPLICIT SCALAR
  real(mytype), dimension(ny) :: rrmt,qqmt,vvmt,ssmt !!TIME IMPLICIT SCALAR (with HPL)

  !O6SVV
  real(mytype), dimension(ny) :: newsm,newtm,newsmt,newtmt
  real(mytype), dimension(ny) :: newrm,ttm,newrmt,ttmt

  !module pressure
  real(mytype), save, allocatable, dimension(:,:) :: dpdyx1,dpdyxn,dpdzx1,dpdzxn
  real(mytype), save, allocatable, dimension(:,:) :: dpdxy1,dpdxyn,dpdzy1,dpdzyn
  real(mytype), save, allocatable, dimension(:,:) :: dpdxz1,dpdxzn,dpdyz1,dpdyzn

  !module inflow
  real(mytype), save, allocatable, dimension(:,:) :: bxx1,bxy1,bxz1,bxxn,bxyn,bxzn,bxo,byo,bzo
  real(mytype), save, allocatable, dimension(:,:) :: byx1,byy1,byz1,byxn,byyn,byzn
  real(mytype), save, allocatable, dimension(:,:) :: bzx1,bzy1,bzz1,bzxn,bzyn,bzzn

  !module derpres
  real(mytype),dimension(nxm) :: cfx6,ccx6,cbx6,cfxp6,ciwxp6,csxp6,&
  cwxp6,csx6,cwx6,cifx6,cicx6,cisx6
  real(mytype),dimension(nxm) :: cibx6,cifxp6,cisxp6,ciwx6
  real(mytype),dimension(nx) :: cfi6,cci6,cbi6,cfip6,csip6,cwip6,csi6,&
  cwi6,cifi6,cici6,cibi6,cifip6
  real(mytype),dimension(nx) :: cisip6,ciwip6,cisi6,ciwi6
  real(mytype),dimension(nym) :: cfy6,ccy6,cby6,cfyp6,csyp6,cwyp6,csy6
  real(mytype),dimension(nym) :: cwy6,cify6,cicy6,ciby6,cifyp6,cisyp6,&
  ciwyp6,cisy6,ciwy6
  real(mytype),dimension(ny) :: cfi6y,cci6y,cbi6y,cfip6y,csip6y,cwip6y,&
  csi6y,cwi6y,cifi6y,cici6y
  real(mytype),dimension(ny) :: cibi6y,cifip6y,cisip6y,ciwip6y,cisi6y,ciwi6y
  real(mytype),dimension(nzm) :: cfz6,ccz6,cbz6,cfzp6,cszp6,cwzp6,csz6
  real(mytype),dimension(nzm) :: cwz6,cifz6,cicz6,cibz6,cifzp6,ciszp6,&
  ciwzp6,cisz6,ciwz6
  real(mytype),dimension(nz) :: cfi6z,cci6z,cbi6z,cfip6z,csip6z,cwip6z,&
  csi6z,cwi6z,cifi6z,cici6z
  real(mytype),dimension(nz) :: cibi6z,cifip6z,cisip6z,ciwip6z,cisi6z,ciwi6z

  !module waves
  complex(mytype), dimension(nz/2+1) :: zkz,zk2,ezs
  complex(mytype), dimension(ny) :: yky,yk2,eys
  complex(mytype), dimension(nx) :: xkx,xk2,exs

  !module mesh
  real(mytype), dimension(ny) :: ppy,pp2y,pp4y
  real(mytype), dimension(ny) :: ppyi,pp2yi,pp4yi
  real(mytype), dimension(ny) :: yp,ypi,del
  real(mytype), dimension(ny) :: yeta,yetai
  real(mytype) :: alpha,beta

end module variables

module param

  use decomp_2d, only : mytype

  integer :: cont_phi,nclx,ncly,nclz,itr,itime
  integer :: ifft,ivirt,istret,iforc_entree,iturb
  integer :: itype,iin,nscheme,ifirst,ilast,iles
  integer :: isave,ilit,idebmod,imodulo,idemarre,icommence,irecord
  integer :: iscalar,nxboite,istat,iread,iadvance_time,ntik
  real(mytype) :: xlx,xlx_pi,xlx_pf,yly,zlz,dx,dy,dz,dx2,dy2,dz2,t,xxk1,xxk2
  real(mytype) :: dt,xnu,noise,noise1,pi,twopi,u1,u2,angle,angle1,pfront
  real(mytype) :: tem1,tem2,tem3,zle,zld,lockwidth,callstat,r0,r1,h0

  !LES
  integer :: jLES
  real(mytype) :: smagcst,walecst,dys,FSGS,rxxnu
  real(mytype) :: eps_factor ! Smoothing factor

  character :: filesauve*80, filenoise*80, &
  nchamp*80,filepath*80, fileturb*80, filevisu*80, datapath*80
  real(mytype), dimension(5) :: adt,bdt,cdt,gdt
  real(mytype) :: nu0snu !!OPTIMAL LES

  integer :: save_w,save_w1,save_w2,save_w3,save_qc,save_pc
  integer :: save_ux,save_uy,save_uz,save_phi,save_pre,save_diss
  integer :: save_uxm,save_uym,save_uzm,save_phim,save_prem,save_dissm
  integer :: save_ibm,save_dmap,save_utmap,save_dudx,save_dudy,save_dudz
  integer :: save_dvdx,save_dvdy,save_dvdz,save_dwdx,save_dwdy,save_dwdz
  integer :: save_dphidx,save_dphidy,save_dphidz,save_abs,save_V
  integer :: ilag,npif,izap

  !module tripping
  integer ::  z_modes, nxt_itr, itrip
  real(mytype) ::  zs_param, zs_tr, A_trip, randomseed
  real(mytype), allocatable, dimension(:) :: h_coeff, h_nxt,h_i

end module param

module ibm

  use decomp_2d, only : mytype

  integer,allocatable:: nyj0(:,:), nyj1(:,:)
  real(mytype) :: x0ramp, y0ramp, layer, declramp
  real(mytype),allocatable :: abs_coef2(:,:,:)

end module ibm

module complex_geometry

use decomp_2d,only : mytype
use variables,only : nx,ny,nz,nxm,nym,nzm

  integer     ,parameter                    :: nraf=20
  integer     ,parameter                    :: nobjmax=1
  integer     ,allocatable,dimension(:,:)   :: nobjx,nobjy,nobjz
  integer     ,allocatable,dimension(:,:,:) :: nxipif,nxfpif,nyipif,nyfpif,nzipif,nzfpif
  real(mytype),allocatable,dimension(:,:,:) :: xi,xf,yi,yf,zi,zf
  integer,parameter :: nxraf=(nxm)*nraf+1,nyraf=(nym)*nraf+1,nzraf=(nzm)*nraf+1
end module complex_geometry

module derivX

  use decomp_2d, only : mytype

  real(mytype) :: alcaix6,acix6,bcix6
  real(mytype) :: ailcaix6,aicix6,bicix6,cicix6,dicix6
  real(mytype) :: alfa1x,af1x,bf1x,cf1x,df1x,alfa2x,af2x,alfanx,afnx,bfnx
  real(mytype) :: cfnx,dfnx,alfamx,afmx,alfaix,afix,bfix,alsa1x,as1x,bs1x
  real(mytype) :: cs1x,ds1x,alsa2x,as2x,alsanx,asnx,bsnx,csnx,dsnx,alsamx
  real(mytype) :: asmx,alsa3x,as3x,bs3x,alsatx,astx,bstx
  real(mytype) :: alsaixt,asixt,bsixt,csixt,dsixt

  !O6SVV
  real(mytype) :: alsa4x,as4x,bs4x,cs4x
  real(mytype) :: alsattx,asttx,bsttx,csttx
  real(mytype) :: alsaix,asix,bsix,csix,dsix

end module derivX

module derivY

  use decomp_2d, only : mytype

  real(mytype) :: alcaiy6,aciy6,bciy6
  real(mytype) :: ailcaiy6,aiciy6,biciy6,ciciy6,diciy6
  real(mytype) :: alfa1y,af1y,bf1y,cf1y,df1y,alfa2y,af2y,alfany,afny,bfny
  real(mytype) :: cfny,dfny,alfamy,afmy,alfajy,afjy,bfjy,alsa1y,as1y,bs1y
  real(mytype) :: cs1y,ds1y,alsa2y,as2y,alsany,asny,bsny,csny,dsny,alsamy
  real(mytype) :: asmy,alsa3y,as3y,bs3y,alsaty,asty,bsty
  real(mytype) :: alsajyt,asjyt,bsjyt,csjyt,dsjyt

  !O6SVV
  real(mytype) :: alsa4y,as4y,bs4y,cs4y
  real(mytype) :: alsatty,astty,bstty,cstty
  real(mytype) :: alsajy,asjy,bsjy,csjy,dsjy

end module derivY

module derivZ

  use decomp_2d, only : mytype

  real(mytype) :: alcaiz6,aciz6,bciz6
  real(mytype) :: ailcaiz6,aiciz6,biciz6,ciciz6,diciz6
  real(mytype) :: alfa1z,af1z,bf1z,cf1z,df1z,alfa2z,af2z,alfanz,afnz,bfnz
  real(mytype) :: cfnz,dfnz,alfamz,afmz,alfakz,afkz,bfkz,alsa1z,as1z,bs1z
  real(mytype) :: cs1z,ds1z,alsa2z,as2z,alsanz,asnz,bsnz,csnz,dsnz,alsamz
  real(mytype) :: asmz,alsa3z,as3z,bs3z,alsatz,astz,bstz
  real(mytype) :: alsakzt,askzt,bskzt,cskzt,dskzt

  !O6SVV
  real(mytype) :: alsa4z,as4z,bs4z,cs4z
  real(mytype) :: alsattz,asttz,bsttz,csttz
  real(mytype) :: alsakz,askz,bskz,cskz,dskz

end module derivZ

module parfiX

  use decomp_2d, only : mytype

  real(mytype) :: fia1x, fib1x, fic1x, fid1x, fie1x, fia2x, fib2x, fic2x, fid2x
  real(mytype) :: fie2x, fia3x, fib3x, fic3x, fid3x, fie3x, fianx, fibnx, ficnx, fidnx
  real(mytype) :: fienx, fiamx, fibmx, ficmx, fidmx, fiemx, fiapx, fibpx, ficpx, fidpx
  real(mytype) :: fiepx, fiaix, fibix, ficix, fidix, fialx, fibex, fih1x, fih2x, fih3x,fih4x
end module parfiX

module parfiY

  use decomp_2d, only : mytype

  real(mytype) :: fia1y, fib1y, fic1y, fid1y, fie1y, fia2y, fib2y, fic2y, fid2y
  real(mytype) :: fie2y, fia3y, fib3y, fic3y, fid3y, fie3y, fiany, fibny, ficny, fidny
  real(mytype) :: fieny, fiamy, fibmy, ficmy, fidmy, fiemy, fiapy, fibpy, ficpy, fidpy
  real(mytype) :: fiepy, fiaiy, fibiy, ficiy, fidiy, fialy, fibey, fih1y, fih2y, fih3y,fih4y
end module parfiY

module parfiZ

  use decomp_2d, only : mytype

  real(mytype) :: fia1z, fib1z, fic1z, fid1z, fie1z, fia2z, fib2z, fic2z, fid2z
  real(mytype) :: fie2z, fia3z, fib3z, fic3z, fid3z, fie3z, fianz, fibnz, ficnz, fidnz
  real(mytype) :: fienz, fiamz, fibmz, ficmz, fidmz, fiemz, fiapz, fibpz, ficpz, fidpz
  real(mytype) :: fiepz, fiaiz, fibiz, ficiz, fidiz, fialz, fibez, fih1z, fih2z, fih3z,fih4z

end module parfiZ
