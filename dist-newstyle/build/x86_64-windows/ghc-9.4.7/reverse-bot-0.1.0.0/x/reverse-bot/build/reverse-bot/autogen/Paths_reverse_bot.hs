{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_reverse_bot (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "A:\\haskell\\cabal\\bin"
libdir     = "A:\\haskell\\cabal\\x86_64-windows-ghc-9.4.7\\reverse-bot-0.1.0.0-inplace-reverse-bot"
dynlibdir  = "A:\\haskell\\cabal\\x86_64-windows-ghc-9.4.7"
datadir    = "A:\\haskell\\cabal\\x86_64-windows-ghc-9.4.7\\reverse-bot-0.1.0.0"
libexecdir = "A:\\haskell\\cabal\\reverse-bot-0.1.0.0-inplace-reverse-bot\\x86_64-windows-ghc-9.4.7\\reverse-bot-0.1.0.0"
sysconfdir = "A:\\haskell\\cabal\\etc"

getBinDir     = catchIO (getEnv "reverse_bot_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "reverse_bot_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "reverse_bot_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "reverse_bot_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "reverse_bot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "reverse_bot_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
