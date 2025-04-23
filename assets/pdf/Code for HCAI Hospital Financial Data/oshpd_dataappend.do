clear 
set more off
set type double

gl path "[[INSERT PATH HERE]]"
gl data "$path/Data/Processed"

use "$data/1989-1990/interimdata", clear // 6/30/89 - 6/29/90
g fiscal_year = 1990

append using "$data/1990-1991/interimdata"
replace fiscal_year = 1991 if fiscal_year == .
	
append using "$data/1991-1992/interimdata"
replace fiscal_year = 1992 if fiscal_year == . 

append using "$data/1992-1993 (first half)/interimdata"
replace fiscal_year = 19931 if fiscal_year == . 

append using "$data/1992-1993 (second half)/interimdata"
replace fiscal_year = 19932 if fiscal_year == . 

append using "$data/1993-1994/interimdata"
replace fiscal_year = 1994 if fiscal_year == . 

append using "$data/1994-1995/interimdata"
replace fiscal_year = 1995 if fiscal_year == .

append using "$data/1995-1996/interimdata"
replace fiscal_year = 1996 if fiscal_year == .

append using "$data/1996-1997/interimdata"
replace fiscal_year = 1997 if fiscal_year == . 

append using "$data/1997-1998/interimdata"
replace fiscal_year = 1998 if fiscal_year == .

append using "$data/1998-1999/interimdata"
replace fiscal_year = 1999 if fiscal_year == .

append using "$data/1999-2000/interimdata"
replace fiscal_year = 2000 if fiscal_year == .

append using "$data/2000-2001/interimdata"
replace fiscal_year = 2001 if fiscal_year == . 

append using "$data/2001-2002/interimdata"
replace fiscal_year = 2002 if fiscal_year == .

append using "$data/2002-2003/interimdata"
replace fiscal_year = 2003 if fiscal_year == .

append using "$data/2003-2004/interimdata"
replace fiscal_year = 2004 if fiscal_year == .

append using "$data/2004-2005/interimdata"
replace fiscal_year = 2005 if fiscal_year == .

append using "$data/2005-2006/interimdata"
replace fiscal_year = 2006 if fiscal_year == .

append using "$data/2006-2007/interimdata"
replace fiscal_year = 2007 if fiscal_year == .

append using "$data/2007-2008/interimdata"
replace fiscal_year = 2008 if fiscal_year == .

append using "$data/2008-2009/interimdata"
replace fiscal_year = 2009 if fiscal_year == .

append using "$data/2009-2010/interimdata"
replace fiscal_year = 2010 if fiscal_year == .

append using "$data/2010-2011/interimdata"
replace fiscal_year = 2011 if fiscal_year == .

append using "$data/2011-2012/interimdata"
replace fiscal_year = 2012 if fiscal_year == .

append using "$data/2012-2013/interimdata"
replace fiscal_year = 2013 if fiscal_year == .

append using "$data/2013-2014/interimdata"
replace fiscal_year = 2014 if fiscal_year == .

append using "$data/2014-2015/interimdata"
replace fiscal_year = 2015 if fiscal_year == .

append using "$data/2015-2016/interimdata"
replace fiscal_year = 2016 if fiscal_year == .

append using "$data/2016-2017/interimdata"
replace fiscal_year = 2017 if fiscal_year == .

append using "$data/2017-2018/interimdata"
replace fiscal_year = 2018 if fiscal_year == .

append using "$data/2018-2019/interimdata"
replace fiscal_year = 2019 if fiscal_year == .

append using "$data/2019-2020/interimdata"
replace fiscal_year = 2020 if fiscal_year == .

save "$data/fy1990_2020_panel", replace
