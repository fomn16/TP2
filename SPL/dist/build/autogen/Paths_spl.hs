module Paths_spl (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/larissa/.cabal/bin"
libdir     = "/home/larissa/.cabal/lib/x86_64-linux-ghc-7.10.3/spl-0.1.0.0-F08kjG3ljtcFyOy7C3TMXu"
datadir    = "/home/larissa/.cabal/share/x86_64-linux-ghc-7.10.3/spl-0.1.0.0"
libexecdir = "/home/larissa/.cabal/libexec"
sysconfdir = "/home/larissa/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "spl_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "spl_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "spl_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "spl_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "spl_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
