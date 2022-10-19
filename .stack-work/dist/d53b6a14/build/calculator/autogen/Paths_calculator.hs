{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_calculator (
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

bindir     = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\bin"
libdir     = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\lib\\x86_64-windows-ghc-9.0.2\\calculator-0.1.0.0-HokofBbzk1i6aw7HKG1KF1-calculator"
dynlibdir  = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\share\\x86_64-windows-ghc-9.0.2\\calculator-0.1.0.0"
libexecdir = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\libexec\\x86_64-windows-ghc-9.0.2\\calculator-0.1.0.0"
sysconfdir = "C:\\Haskell\\calculator\\.stack-work\\install\\f1a9b30c\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "calculator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "calculator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "calculator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "calculator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "calculator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "calculator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
