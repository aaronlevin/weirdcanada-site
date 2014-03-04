{-# LANGUAGE OverloadedStrings #-}
module Views.Index (
                   layout
)	where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A
import           Text.Blaze.Internal           (preEscapedText)
import           Text.Blaze.Html.Renderer.Text (renderHtml)
import           Data.Monoid                   (mempty)
import           Web.Scotty                    (ActionM)


layout :: Html -> Html -> Html
layout t b = docTypeHtml $ do
           preEscapedText "<!--[if lt IE 7]>      <html class='no-js lt-ie9 lt-ie8 lt-ie7'> <![endif]-->"
           preEscapedText "<!--[if IE 7]>         <html class='no-js lt-ie9 lt-ie8'/> <![endif]-->"
           preEscapedText "<!--[if IE 8]>         <html class='no-js lt-ie9'> <![endif]-->"
           preEscapedText "<!--[if gt IE 8]><!--> <html class='no-js'> <!--<![endif]-->"
           H.head $ do
             H.title t
             -- TODO: Add meta
             H.meta ! charset "utf-8"
             H.meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge,chrome=1"
             H.meta ! name "description" ! content "Weird Canada"
             H.meta ! name "viewport" ! content "width=device-width"
             H.link ! href "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" ! rel  "stylesheet" ! media "screen"
           body $ do
             navBar >> b
             script ! src "//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" $ mempty
             script ! src "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" $ mempty


navBar :: Html
navBar = H.div ! class_ "navbar navbar-default navbar-static-top" $ H.div ! class_ "container" $ do
           H.div ! class_ "navbar-header" $ do
             button ! type_ "button"
                    ! class_ "navbar-toggle" ! dataAttribute "toggle" "collapse" ! dataAttribute "target" ".navbar-collapse" $ do
               a ! class_ "navbar-brand" ! href "#" $ "λ"
           H.div ! class_ "navbar-collapse collapse" $ ul ! class_ "nav navbar-nav" $ do
             li ! class_ "active" $ a ! href "#" $ "Home"
             li $ a ! href "#about" $ "About"
             li $ a ! href "#contact" $ "Contact"

