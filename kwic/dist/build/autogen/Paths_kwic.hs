{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_kwic (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/fomn/.cabal/bin"
libdir     = "/home/fomn/.cabal/lib/x86_64-linux-ghc-8.0.2/kwic-0.1.0.0-MVrlSyVkNJB4HbN56Dkf9"
dynlibdir  = "/home/fomn/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/fomn/.cabal/share/x86_64-linux-ghc-8.0.2/kwic-0.1.0.0"
libexecdir = "/home/fomn/.cabal/libexec"
sysconfdir = "/home/fomn/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "kwic_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "kwic_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "kwic_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "kwic_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "kwic_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "kwic_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
