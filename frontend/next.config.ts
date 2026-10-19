import type { NextConfig } from "next";

const rawBackendUrl =
  process.env.AIRSENSE_API_URL ||
  process.env.NEXT_PUBLIC_API_URL ||
  "https://airsense-api-abxv.onrender.com";

const backendUrl = rawBackendUrl.replace(/\/+$/, "");

const nextConfig: NextConfig = {
  reactCompiler: true,
  async rewrites() {
    return [
      {
        source: "/api/:path*",
        destination: `${backendUrl}/api/:path*`,
      },
    ];
  },
};

export default nextConfig;
