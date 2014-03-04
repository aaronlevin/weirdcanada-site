module Views.Util (
                  blaze
)	where

import           Text.Blaze.Html5              (Html)
import           Text.Blaze.Html.Renderer.Text (renderHtml)
import           Web.Scotty                    (ActionM, html)

blaze :: Html -> ActionM ()
blaze = html . renderHtml

