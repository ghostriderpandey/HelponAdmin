using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;
/// <summary>
/// Summary description for clsImageResize
/// </summary>
/// 
public class clsImageResize
{
    public clsImageResize()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void ResizeImage(string tFname, string tempPath, string outputFilePath, int widthToConvert, int heightToConvert)
    {
        string fPath = tempPath;
        System.Drawing.Image img;
        System.Drawing.Image imgThumb;
        System.Drawing.Graphics grph;

        img = System.Drawing.Image.FromFile(fPath);
        int wdth = 0; int hgth = 0;
        if (img.Width > 210)
        {
            wdth = 210;
            hgth = img.Height;
        }
        else
        {
            wdth = img.Width;
            hgth = img.Height;
        }
        imgThumb = new Bitmap(wdth, hgth);
        grph = Graphics.FromImage(imgThumb);
        System.Drawing.Rectangle rec = new Rectangle(0, 0, wdth, hgth);
        grph.DrawImage(img, rec);
        imgThumb.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Jpeg);

        imgThumb.Dispose();
        img.Dispose();
        grph.Dispose();

    }
    public void ResizePhoto(string tFname, string tempPath, string outputFilePath, int widthToConvert, int heightToConvert)
    {
        string fPath = tempPath;
        System.Drawing.Image img;
        System.Drawing.Image imgThumb;
        System.Drawing.Graphics grph;

        img = System.Drawing.Image.FromFile(fPath);
        int wdth = 0; int hgth = 0;
        if (img.Width > 100)
        {
            wdth = widthToConvert;
            hgth = heightToConvert;
        }
        else
        {
            wdth = img.Width;
            hgth = img.Height;
        }
        imgThumb = new Bitmap(wdth, hgth);
        grph = Graphics.FromImage(imgThumb);
        System.Drawing.Rectangle rec = new Rectangle(0, 0, wdth, hgth);
        grph.DrawImage(img, rec);
        imgThumb.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Jpeg);

        imgThumb.Dispose();
        img.Dispose();
        grph.Dispose();

    }

    public void FixedSize(string tFname, string tempPath, string outputFilePath, int Width, int Height)
    {
        System.Drawing.Image imgPhoto = System.Drawing.Image.FromFile(tempPath);
        int sourceWidth = Width;
        int sourceHeight =Height;
        float nPercentW = 0;
        nPercentW = ((float)Width / (float)sourceWidth);
        int destHeight = (int)(sourceHeight * nPercentW);
        Bitmap bmPhoto = new Bitmap(Width, destHeight);
        Graphics grPhoto = Graphics.FromImage(bmPhoto);
        grPhoto.SmoothingMode = SmoothingMode.HighQuality;
        grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
        grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
        grPhoto.DrawImage(imgPhoto, 0, 0, (int)Width, (int)destHeight);
        grPhoto.Dispose();
        bmPhoto.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Png);
    }
    public static void ResizeImage(Stream sourcePath, string targetPath)
    {
        try
        {
            var image = System.Drawing.Image.FromStream(sourcePath);
            int width = Convert.ToInt32((image.Width));
            int height = Convert.ToInt32((image.Height));
            var destRect = new Rectangle(0, 0, width, height);
            var destImage = new Bitmap(width, height);
            destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);
            var thumbGraph = Graphics.FromImage(destImage);
            thumbGraph.CompositingMode = CompositingMode.SourceCopy;
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.PixelOffsetMode = PixelOffsetMode.HighQuality;
            var wrapMode = new ImageAttributes();
            wrapMode.SetWrapMode(System.Drawing.Drawing2D.WrapMode.TileFlipXY);
            thumbGraph.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
            // Dim ms As MemoryStream = New MemoryStream()
            destImage.Save(targetPath, ImageFormat.Jpeg);
            // Return ms.ToArray()
        }
        catch (Exception ex)
        {
        }

    }
    public static void Compressimage(Stream sourcePath, string targetPath, String filename)
    {
        try
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                float maxHeight = 900.0f;
                float maxWidth = 900.0f;
                int newWidth;
                int newHeight;
                string extension;
                Bitmap originalBMP = new Bitmap(sourcePath);
                int originalWidth = originalBMP.Width;
                int originalHeight = originalBMP.Height;

                if (originalWidth > maxWidth || originalHeight > maxHeight)
                {

                    // To preserve the aspect ratio  
                    float ratioX = (float)maxWidth / (float)originalWidth;
                    float ratioY = (float)maxHeight / (float)originalHeight;
                    float ratio = Math.Min(ratioX, ratioY);
                    newWidth = (int)(originalWidth * ratio);
                    newHeight = (int)(originalHeight * ratio);
                }
                else
                {
                    newWidth = (int)originalWidth;
                    newHeight = (int)originalHeight;

                }
                Bitmap bitMAP1 = new Bitmap(originalBMP, newWidth, newHeight);
                Graphics imgGraph = Graphics.FromImage(bitMAP1);
                extension = Path.GetExtension(targetPath);
                if (extension == ".png" || extension == ".gif")
                {
                    imgGraph.SmoothingMode = SmoothingMode.AntiAlias;
                    imgGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    imgGraph.DrawImage(originalBMP, 0, 0, newWidth, newHeight);


                    bitMAP1.Save(targetPath, image.RawFormat);

                    bitMAP1.Dispose();
                    imgGraph.Dispose();
                    originalBMP.Dispose();
                }
                else if (extension == ".jpg")
                {

                    imgGraph.SmoothingMode = SmoothingMode.AntiAlias;
                    imgGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    imgGraph.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                    ImageCodecInfo jpgEncoder = GetEncoder(ImageFormat.Jpeg);
                    Encoder myEncoder = Encoder.Quality;
                    EncoderParameters myEncoderParameters = new EncoderParameters(1);
                    EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 50L);
                    myEncoderParameters.Param[0] = myEncoderParameter;
                    bitMAP1.Save(targetPath, jpgEncoder, myEncoderParameters);

                    bitMAP1.Dispose();
                    imgGraph.Dispose();
                    originalBMP.Dispose();

                }
            }
        }
        catch (Exception)
        {
            throw;

        }
    }
    public static ImageCodecInfo GetEncoder(ImageFormat format)
    {

        ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();

        foreach (ImageCodecInfo codec in codecs)
        {
            if (codec.FormatID == format.Guid)
            {
                return codec;
            }
        }
        return null;
    }
    public void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }
}
