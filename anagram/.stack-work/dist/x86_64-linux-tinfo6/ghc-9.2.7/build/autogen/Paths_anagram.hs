{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_anagram (
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
version = Version [1,4,0,8] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/bin"
libdir     = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/lib/x86_64-linux-ghc-9.2.7/anagram-1.4.0.8-AowDlQkRuI1Ekln6tqTQxo"
dynlibdir  = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/share/x86_64-linux-ghc-9.2.7/anagram-1.4.0.8"
libexecdir = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/libexec/x86_64-linux-ghc-9.2.7/anagram-1.4.0.8"
sysconfdir = "/home/kebab/exercism/haskell/anagram/.stack-work/install/x86_64-linux-tinfo6/0d5e461e085899c647d2479fb74278e74420a2f9e176330128e899b90fbb7d83/9.2.7/etc"

getBinDir     = catchIO (getEnv "anagram_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "anagram_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "anagram_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "anagram_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "anagram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "anagram_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
