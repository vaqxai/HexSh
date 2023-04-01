--[[For some I am just a rib, but for others the biggest dream, you can easily but often difficult with me, many do not understand my intentions and do not get along with it, what am I?]]
if (!HexSh) then return end
HexSh.CachedImgurImage = HexSh.CachedImgurImage or {}

file.CreateDir( "hexsh/cache" );
file.CreateDir( "hexsh/cache/img" );
    
if ( !file.Exists( "hexsh/cache/img/zizhogv.png", "DATA" ) ) then 
    http.Fetch( "https://i.imgur.com/zizhogv.png", function( Body, Len, Headers )     
        file.Write( "hexsh/cache/img/zizhogv.png", Body )
        HexSh.CachedImgurImage[ ImgurID ] = Material( "data/hexsh/cache/img/zizhogv.png", "noclamp smooth");
    end)
else
    HexSh.CachedImgurImage[ "zizhogv" ] = Material( "data/hexsh/cache/img/zizhogv.png", "noclamp smooth" )
end

function HexSh:getImgurImage( ImgurID )
    if HexSh.CachedImgurImage[ ImgurID ] then
        return HexSh.CachedImgurImage[ ImgurID ]
    elseif file.Exists( "hexsh/cache/img/" .. ImgurID .. ".png", "DATA" ) then
        HexSh.CachedImgurImage[ ImgurID ] = Material( "data/hexsh/cache/img/" .. ImgurID .. ".png", "noclamp smooth" )
    else
        http.Fetch( "https://i.imgur.com/" .. ImgurID .. ".png", function( Body, Len, Headers )     
            file.Write( "hexsh/cache/img/" .. ImgurID .. ".png", Body )
            HexSh.CachedImgurImage[ ImgurID ] = Material( "data/hexsh/cache/img/" .. ImgurID .. ".png", "noclamp smooth");
        end)
    end
    return HexSh.CachedImgurImage[ "zizhogv" ]
end;