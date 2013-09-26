
module AutoCompList ( autocompList) where
import MFlow.Wai.Blaze.Html.All
import Menu
import Data.List

autocompList= do
   r <- askm  $   p <<  "Autocomplete with a list of selected entries"
            ++> p <<  "enter  and press enter"
            ++> p <<  "when submit is pressed, the entries are returned"
            ++> wautocompleteList "red,green,blue" filter1 ["red"]
            <** submitButton "submit"
   askm  $ p << ( show r ++ " selected")  ++> wlink () (p <<  " menu")

   where
   filter1 s = return $ filter (isPrefixOf s) ["red","red rose","green","green grass","blue","blues"]

-- to run it alone, change askm by ask and uncomment this:
--main= runNavigation "" $ transientNav autocompList
