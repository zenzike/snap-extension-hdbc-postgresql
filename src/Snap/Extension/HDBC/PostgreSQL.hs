{-|

'Snap.Extension.HDBC.PostgreSQL' implements a 'MonadHDBC' by using
a connection to an PostgreSQL database.

-}

module Snap.Extension.HDBC.PostgreSQL
  ( hdbcInitializer
  , module Snap.Extension.HDBC
  ) where

import Control.Monad.IO.Class ( liftIO )

import Database.HDBC         ( ConnWrapper (..) )
import Database.HDBC.PostgreSQL ( connectPostgreSQL )

import Snap.Extension ( Initializer, mkInitializer )
import Snap.Extension.HDBC

-- | The Initializer for 'Connection'.
-- The 'String' is the connection string for the database.
hdbcInitializer :: String -> Initializer HDBCState
hdbcInitializer args =
  liftIO (connectPostgreSQL args) >>= mkInitializer . HDBCState . ConnWrapper


