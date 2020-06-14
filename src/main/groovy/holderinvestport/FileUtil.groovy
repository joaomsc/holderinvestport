package holderinvestport

import grails.util.Holders
import org.springframework.web.multipart.MultipartFile

class FileUtil {

    static String getRootPath() {

        def relativeWebappPath = "src/main/webapp/"
        def relativeAssetsImagesPath = "grails-app/assets/"

        def realPath = Holders.servletContext?.getRealPath("")

        return realPath.replace(relativeWebappPath, relativeAssetsImagesPath)
    }


    static File makeDirectory(String path) {
        File file = new File(path)
        if (!file.exists()) {
            file.mkdirs()
        }
        return file
    }

//    request.getFile("productFile")
    static String uploadCompanyImage(Long companyId, MultipartFile multipartFile) {
        if (companyId && multipartFile) {
            String companyImagePath = "${getRootPath()}company-images/"
            makeDirectory(companyImagePath)
            def file = new File(companyImagePath, companyId + "-" + multipartFile.originalFilename)
            multipartFile.transferTo(file)
            return file.toPath().toString()
        }
        return ""
    }

    static void deleteCompanyImage(String companyImagePath) {
        if(companyImagePath) {
            def file = new File(companyImagePath)
            if (file.exists()) {
                file.delete();
            }
        }
    }
}
