/**
 * Safe YouTube Embed Converter
 * Converts watch links into embed links
 */

export function getYouTubeEmbedUrl(url: string): string {

  if (!url) return "";

  try {

    // Already embed
    if (url.includes("embed")) {
      return url;
    }

    // youtube watch link
    if (url.includes("watch?v=")) {

      const videoId =
        url.split("watch?v=")[1].split("&")[0];

      return `https://www.youtube.com/embed/${videoId}`;
    }

    // youtu.be link
    if (url.includes("youtu.be/")) {

      const videoId =
        url.split("youtu.be/")[1].split("?")[0];

      return `https://www.youtube.com/embed/${videoId}`;
    }

    return url;

  }

  catch {

    return "";

  }

}



export function getYouTubeVideoId(url: string): string | null {

  try {

    if (url.includes("watch?v=")) {
      return url.split("watch?v=")[1].split("&")[0];
    }

    if (url.includes("youtu.be/")) {
      return url.split("youtu.be/")[1].split("?")[0];
    }

    if (url.includes("embed/")) {
      return url.split("embed/")[1].split("?")[0];
    }

    return null;

  }

  catch {

    return null;

  }

}