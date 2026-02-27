/**
 * Converts a YouTube URL to embed format
 * Supports various YouTube URL formats:
 * - https://www.youtube.com/watch?v=VIDEO_ID
 * - https://youtube.com/watch?v=VIDEO_ID
 * - https://youtu.be/VIDEO_ID
 * - https://www.youtube.com/embed/VIDEO_ID (already embed)
 */
export function getYouTubeEmbedUrl(url: string): string {
  try {
    // If already an embed URL, return as is
    if (url.includes('/embed/')) {
      return url;
    }

    // Extract video ID from various YouTube URL formats
    let videoId = '';

    // Format: youtube.com/watch?v=VIDEO_ID
    if (url.includes('watch?v=')) {
      const urlObj = new URL(url);
      videoId = urlObj.searchParams.get('v') || '';
    }
    // Format: youtu.be/VIDEO_ID
    else if (url.includes('youtu.be/')) {
      const parts = url.split('youtu.be/');
      videoId = parts[1]?.split('?')[0] || '';
    }
    // Format: youtube.com/v/VIDEO_ID
    else if (url.includes('/v/')) {
      const parts = url.split('/v/');
      videoId = parts[1]?.split('?')[0] || '';
    }

    // If we found a video ID, return embed URL
    if (videoId) {
      return `https://www.youtube.com/embed/${videoId}`;
    }

    // If no video ID found, return original URL
    return url;
  } catch (error) {
    console.error('Error parsing YouTube URL:', error);
    return url;
  }
}

/**
 * Extracts video ID from YouTube URL
 */
export function getYouTubeVideoId(url: string): string | null {
  try {
    if (url.includes('watch?v=')) {
      const urlObj = new URL(url);
      return urlObj.searchParams.get('v');
    } else if (url.includes('youtu.be/')) {
      const parts = url.split('youtu.be/');
      return parts[1]?.split('?')[0] || null;
    } else if (url.includes('/embed/')) {
      const parts = url.split('/embed/');
      return parts[1]?.split('?')[0] || null;
    }
    return null;
  } catch (error) {
    console.error('Error extracting YouTube video ID:', error);
    return null;
  }
}
