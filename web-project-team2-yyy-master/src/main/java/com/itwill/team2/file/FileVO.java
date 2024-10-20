package com.itwill.team2.file;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FileVO {
    private long id;
    private String originalName;
    private String savedName;
    private String savedPath;
    private String ext;
    private long size;
}