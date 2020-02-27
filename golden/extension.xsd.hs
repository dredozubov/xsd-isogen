-- This file was generated by xsd-isogen version 0.1.0.0
-- https://github.com/dredozubov/xsd-isogen

{-# OPTIONS_GHC -Wno-unused-imports #-}
module Dummy where

import Control.DeepSeq
import Data.Scientific
import Data.THGen.XML
import Text.XML.DOM.Parser
import Text.XML.Writer
import Text.XML.ParentAttributes
import Prelude hiding ((*), (+))


{-|
Generated from: basetype
-}
"Basetype" =:= record ParserAndGenerator
  ! "a" [t|Text|]

{-|
Generated from: ext2
-}
"Ext2" =:= record ParserAndGenerator
  ! "a" [t|Text|]
  ! "c" [t|Integer|]

{-|
Generated from: ext1
-}
"Ext1" =:= record ParserAndGenerator
  ! "a" [t|Text|]
  ! "b" [t|Integer|]

data AnyXmlBasetype
  = TheXmlBasetype !XmlBasetype
  | TheXmlExt2 !XmlExt2
  | TheXmlExt1 !XmlExt1
  deriving (Eq, Show)

instance NFData AnyXmlBasetype where
  rnf = rwhnf
 
instance FromDom AnyXmlBasetype where
  fromDom = do
    tp <- parseAttribute
      (matchName "{http://www.w3.org/2001/XMLSchema-instance}type")
      Right
    case tp of
      "Basetype" -> TheXmlBasetype <$> fromDom
      "Ext2" -> TheXmlExt2 <$> fromDom
      "Ext1" -> TheXmlExt1 <$> fromDom
      _ -> throwParserError (PEOther "Unexpected type")

instance ToXML AnyXmlBasetype where
  toXML (TheXmlBasetype a) = toXML a
  toXML (TheXmlExt2 a) = toXML a
  toXML (TheXmlExt1 a) = toXML a

instance ToXmlParentAttributes AnyXmlBasetype where
  toXmlParentAttributes (TheXmlBasetype a) =
    ("{http://www.w3.org/2001/XMLSchema-instance}type", "Basetype")
    : toXmlParentAttributes a
  toXmlParentAttributes (TheXmlExt2 a) =
    ("{http://www.w3.org/2001/XMLSchema-instance}type", "Ext2")
    : toXmlParentAttributes a
  toXmlParentAttributes (TheXmlExt1 a) =
    ("{http://www.w3.org/2001/XMLSchema-instance}type", "Ext1")
    : toXmlParentAttributes a
{-|
Generated from: other
-}
"Other" =:= record ParserAndGenerator
  ! "a" [t|AnyXmlBasetype|]

{-|
Generated from: some
-}
"Some" =:= record ParserAndGenerator
  ! "a" [t|Text|]


