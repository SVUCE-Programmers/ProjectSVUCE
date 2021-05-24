package com.svuce.svuce_app;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.pdf.PdfRenderer;
import android.os.ParcelFileDescriptor;

import androidx.annotation.NonNull;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private final String filePrefix = "FlutterPluginPdfViewer";

    private static final String CHANNEL_NAME = "flutter_plugin_pdf_viewer";

    BinaryMessenger binaryMessenger;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        binaryMessenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        new MethodChannel(binaryMessenger, CHANNEL_NAME).setMethodCallHandler(((call, result) -> {
            Log.w("AT MAINACTIVITY",call.method);
            switch (call.method) {
                case "getNumberOfPages":
                    final String numResult = getNumberOfPages((String) call.argument("filePath"));
                    result.success(numResult);

                    break;
                case "getPage":
                    final String pageResult = getPage((String) call.argument("filePath"),
                            (int) call.argument("pageNumber"));
                    result.success(pageResult);

                    break;
                default:
                    result.notImplemented();
                    break;
            }
        }));
    }


    private String getNumberOfPages(String filePath) {
        File pdf = new File(filePath);
        try {
            clearCacheDir();
            PdfRenderer renderer = new PdfRenderer(ParcelFileDescriptor.open(pdf, ParcelFileDescriptor.MODE_READ_ONLY));
            Bitmap bitmap;
            final int pageCount = renderer.getPageCount();
            return String.format("%d", pageCount);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    private boolean clearCacheDir() {
        try {
            File directory = getApplicationContext().getCacheDir();
            FilenameFilter myFilter = new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    return name.toLowerCase().startsWith(filePrefix.toLowerCase());
                }
            };
            File[] files = directory.listFiles(myFilter);
            // Log.d("Cache Files", "Size: " + files.length);
            for (int i = 0; i < files.length; i++) {
                // Log.d("Files", "FileName: " + files[i].getName());
                files[i].delete();
            }
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private String getFileNameFromPath(String name) {
        String filePath = name.substring(name.lastIndexOf('/') + 1);
        filePath = filePath.substring(0, filePath.lastIndexOf('.'));
        return String.format("%s-%s", filePrefix, filePath);
    }

    private String createTempPreview(Bitmap bmp, String name, int page) {
        String fileNameOnly = getFileNameFromPath(name);
        File file;
        try {
            String fileName = String.format("%s-%d.png", fileNameOnly, page);
            file = File.createTempFile(fileName, null, getApplicationContext().getCacheDir());
            FileOutputStream out = new FileOutputStream(file);
            bmp.compress(Bitmap.CompressFormat.PNG, 100, out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return file.getAbsolutePath();
    }

    private String getPage(String filePath, int pageNumber) {
        File pdf = new File(filePath);
        try {
            PdfRenderer renderer = new PdfRenderer(ParcelFileDescriptor.open(pdf, ParcelFileDescriptor.MODE_READ_ONLY));
            final int pageCount = renderer.getPageCount();
            if (pageNumber > pageCount) {
                pageNumber = pageCount;
            }

            PdfRenderer.Page page = renderer.openPage(--pageNumber);

            double width = getActivity().getResources().getDisplayMetrics().densityDpi * page.getWidth();
            double height = getActivity().getResources().getDisplayMetrics().densityDpi * page.getHeight();
            final double docRatio = width / height;

            width = 2048;
            height = (int) (width / docRatio);
            Bitmap bitmap = Bitmap.createBitmap((int) width, (int) height, Bitmap.Config.ARGB_8888);
            // Change background to white
            Canvas canvas = new Canvas(bitmap);
            canvas.drawColor(Color.WHITE);
            // Render to bitmap
            page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY);
            try {
                return createTempPreview(bitmap, filePath, pageNumber);
            } finally {
                // close the page
                page.close();
                // close the renderer
                renderer.close();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }

        return null;
    }
}