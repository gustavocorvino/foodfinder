{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
-- | Common handler functions.
module Handler.Common where

import Data.FileEmbed (embedFile)
import Import

-- These handlers embed files in the executable at compile time to avoid a
-- runtime dependency, and for efficiency.

getFaviconR :: Handler TypedContent
getFaviconR = do cacheSeconds $ 60 * 60 * 24 * 30 -- cache for a month
                 return $ TypedContent "image/x-icon"
                        $ toContent $(embedFile "config/favicon.ico")

getRobotsR :: Handler TypedContent
getRobotsR = return $ TypedContent typePlain
                    $ toContent $(embedFile "config/robots.txt")

postUserInserirR :: Handler TypedContent
postUserInserirR = return $ TypedContent typePlain
                          $ toContent $(embedFile "static/oops.html")

getBuscaR :: Handler TypedContent
getBuscaR = return  $ TypedContent typePlain
                    $ toContent $(embedFile "static/oops.html")

patchAlteraR :: Handler TypedContent
patchAlteraR = return  $ TypedContent typePlain
                          $ toContent $(embedFile "static/oops.html")

deleteApagarR :: Handler TypedContent
deleteApagarR = return $ TypedContent typePlain
                         $ toContent $(embedFile "static/oops.html")
