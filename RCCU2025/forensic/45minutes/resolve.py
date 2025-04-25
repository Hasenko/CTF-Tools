import cv2
import os
import numpy as np

def extract_unique_frames(video_path, output_folder, threshold=30):
    os.makedirs(output_folder, exist_ok=True)

    vidcap = cv2.VideoCapture(video_path)
    if not vidcap.isOpened():
        print(f"❌ Failed to open video file: {video_path}")
        return

    count = 0
    saved_count = 0
    success, prev_frame = vidcap.read()

    if not success:
        print("❌ Couldn't read the first frame.")
        return

    # Convert first frame to grayscale
    prev_gray = cv2.cvtColor(prev_frame, cv2.COLOR_BGR2GRAY)

    while success:
        success, frame = vidcap.read()
        if not success:
            break

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        # Compute absolute difference
        diff = cv2.absdiff(prev_gray, gray)
        non_zero_count = np.count_nonzero(diff)

        # Only save if difference exceeds threshold
        if non_zero_count > threshold:
            frame_filename = os.path.join(output_folder, f"frame_{saved_count:05}.jpg")
            cv2.imwrite(frame_filename, frame)
            print(f"✅ Saved {frame_filename}")
            saved_count += 1
            prev_gray = gray  # update reference frame

        count += 1

    vidcap.release()
    print(f"🎉 Done! Checked {count} frames, saved {saved_count} unique frames.")

# Example usage
extract_unique_frames("video.mp4", "output_frames")
